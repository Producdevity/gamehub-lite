#!/bin/bash
#
# GameHub Lite Patcher
# Applies patches to GameHub 5.3.5 APK to create GameHub Lite
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATCHES_DIR="$SCRIPT_DIR/patches535"
WORK_DIR="$SCRIPT_DIR/work"
OUTPUT_DIR="$SCRIPT_DIR/output"

# Keystore configuration (can be overridden via environment variables)
KEYSTORE="${KEYSTORE:-$SCRIPT_DIR/keystore/debug.keystore}"
KEYSTORE_PASS="${KEYSTORE_PASS:-android}"
KEY_ALIAS="${KEY_ALIAS:-androiddebugkey}"

# Release mode: set RELEASE=true to build all package variants
RELEASE="${RELEASE:-false}"

# Version for output filenames (extracted from apktool.yml or set manually)
VERSION="${VERSION:-}"

# Base package name used in patches
BASE_PACKAGE="emuready.gamehub.lite"

# Variant definitions as space-separated pairs: "name:package"
# Order matters for release builds
VARIANTS="base:emuready.gamehub.lite antutu:com.antutu.ABenchMark alt-antutu:com.antutu.benchmark.full ludashi:com.ludashi.aibench pubg:com.tencent.ig"

# Get package name for a variant
get_variant_package() {
  local variant="$1"
  for pair in $VARIANTS; do
    local name="${pair%%:*}"
    local package="${pair#*:}"
    if [ "$name" = "$variant" ]; then
      echo "$package"
      return 0
    fi
  done
  echo ""
}

# Source APK (can be overridden)
SOURCE_APK="${1:-$SCRIPT_DIR/apk/GameHub-5.3.5.apk}"
OUTPUT_APK="$OUTPUT_DIR/GameHub-Lite-v5.3.5.apk"

print_step() {
  echo -e "${BLUE}==>${NC} $1"
}

print_success() {
  echo -e "${GREEN}[OK]${NC} $1"
}

print_warning() {
  echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
  echo -e "${RED}[ERROR]${NC} $1"
}

# Extract version from apktool.yml after decompilation
extract_version() {
  if [ -z "$VERSION" ] && [ -f "$WORK_DIR/decompiled/apktool.yml" ]; then
    # Format is "  versionName: 5.1.0" or "  versionName: '5.1.0'"
    VERSION=$(grep "versionName:" "$WORK_DIR/decompiled/apktool.yml" | head -1 | awk -F': ' '{print $2}' | tr -d "'" | tr -d ' ')
  fi
  # Default fallback
  VERSION="${VERSION:-5.3.5}"
  print_success "Version: $VERSION"
}

# Replace package name in AndroidManifest.xml for a variant
replace_package_name() {
  local target_package="$1"
  local manifest="$WORK_DIR/decompiled/AndroidManifest.xml"

  if [ "$target_package" = "$BASE_PACKAGE" ]; then
    return 0
  fi

  print_step "Replacing package name: $BASE_PACKAGE -> $target_package"

  # Replace all occurrences of base package with target package
  # This handles:
  # - package="gamehub.lite"
  # - android:authorities="gamehub.lite.xxx"
  # - android:name="gamehub.lite.xxx"
  # - action android:name="gamehub.lite.xxx"
  sed -i.bak "s/${BASE_PACKAGE}/${target_package}/g" "$manifest"
  rm -f "$manifest.bak"

  print_success "Package name replaced"
}

# Restore original AndroidManifest.xml from backup
restore_manifest() {
  if [ -f "$WORK_DIR/decompiled/AndroidManifest.xml.original" ]; then
    cp "$WORK_DIR/decompiled/AndroidManifest.xml.original" "$WORK_DIR/decompiled/AndroidManifest.xml"
  fi
}

# Backup original AndroidManifest.xml
backup_manifest() {
  cp "$WORK_DIR/decompiled/AndroidManifest.xml" "$WORK_DIR/decompiled/AndroidManifest.xml.original"
}

# Get output filename for a variant
get_output_filename() {
  local variant="$1"

  if [ "$variant" = "base" ]; then
    if [ "$RELEASE" = "true" ]; then
      echo "$OUTPUT_DIR/GameHub-Lite-v${VERSION}.apk"
    else
      echo "$OUTPUT_DIR/GameHub-Lite-v5.3.5.apk"
    fi
  else
    echo "$OUTPUT_DIR/GameHub-Lite-v${VERSION}-${variant}.apk"
  fi
}

check_dependencies() {
  print_step "Checking dependencies..."

  local missing=()

  if ! command -v apktool &>/dev/null; then
    missing+=("apktool")
  fi

  if ! command -v java &>/dev/null; then
    missing+=("java")
  fi

  if ! command -v zipalign &>/dev/null && ! command -v "$ANDROID_HOME/build-tools/"*/zipalign &>/dev/null; then
    print_warning "zipalign not found - APK may not be optimized"
  fi

  if ! command -v apksigner &>/dev/null && ! command -v jarsigner &>/dev/null; then
    missing+=("apksigner or jarsigner")
  fi

  if [ ${#missing[@]} -ne 0 ]; then
    print_error "Missing dependencies: ${missing[*]}"
    echo ""
    echo "Install instructions:"
    echo "  macOS:   brew install apktool openjdk"
    echo "  Ubuntu:  sudo apt install apktool openjdk-17-jdk"
    echo "  Arch:    sudo pacman -S apktool jdk17-openjdk"
    exit 1
  fi

  print_success "All dependencies found"
}

verify_source_apk() {
  print_step "Verifying source APK..."

  if [ ! -f "$SOURCE_APK" ]; then
    print_error "Source APK not found: $SOURCE_APK"
    echo ""
    echo "Please provide GameHub 5.3.5 APK as first argument or place it at:"
    echo "  $SCRIPT_DIR/apk/GameHub-5.3.5.apk"
    exit 1
  fi

  # Calculate MD5 of source APK
  local md5
  if command -v md5sum &>/dev/null; then
    md5=$(md5sum "$SOURCE_APK" | awk '{print $1}')
  else
    md5=$(md5 -q "$SOURCE_APK")
  fi

  # Expected MD5 for GameHub 5.3.5
  local expected_md5="e5e1b35b774c482a66333afc51eb14b2" # Replace with actual MD5 if you are intentionally using a different APK

  print_success "Source APK found: $(basename "$SOURCE_APK")"
  echo "         MD5: $md5"
  if [ "$md5" != "$expected_md5" ]; then
    print_warning "MD5 checksum does not match expected value."
    print_warning "Proceeding may lead to unexpected results."
    read -pr "Do you want to continue? (y/N): " choice
    if [[ ! "$choice" =~ ^[Yy]$ ]]; then
      print_error "Aborting."
      exit 1
    fi
  else
    print_success "MD5 checksum verified."
  fi
}

setup_keystore() {
  print_step "Setting up signing keystore..."

  if [ ! -f "$KEYSTORE" ]; then
    mkdir -p "$(dirname "$KEYSTORE")"
    keytool -genkey -v -keystore "$KEYSTORE" \
      -alias "$KEY_ALIAS" \
      -keyalg RSA \
      -keysize 2048 \
      -validity 10000 \
      -storepass "$KEYSTORE_PASS" \
      -keypass "$KEYSTORE_PASS" \
      -dname "CN=GameHub Lite, OU=Community, O=GameHub Lite, L=Unknown, S=Unknown, C=XX"
    print_success "Created debug keystore"
  else
    print_success "Using existing keystore"
  fi
}

decompile_apk() {
  print_step "Decompiling APK (this may take a few minutes)..."

  rm -rf "$WORK_DIR"
  mkdir -p "$WORK_DIR"

  apktool d -f "$SOURCE_APK" -o "$WORK_DIR/decompiled" 2>&1 | tail -5

  print_success "APK decompiled to $WORK_DIR/decompiled"
}

normalize_smali_files() {
  print_step "Normalizing smali files (removing .line directives)..."

  # Remove .line directives to match the patches (which were generated without them)
  # This prevents context mismatches during patching
  local count=$(find "$WORK_DIR/decompiled" -name "*.smali" -type f | wc -l | tr -d ' ')
  echo "  Processing $count smali files..."

  find "$WORK_DIR/decompiled" -name "*.smali" -type f -exec \
    sed -i '' '/^[[:space:]]*\.line [0-9]*$/d' {} \;

  print_success "Smali files normalized"
}

apply_deletions() {
  print_step "Removing telemetry and unnecessary files..."

  local count=0
  local total=$(wc -l <"$PATCHES_DIR/files_to_delete.txt")

  while IFS= read -r file; do
    target="$WORK_DIR/decompiled/$file"
    if [ -e "$target" ]; then
      rm -rf "$target"
      count=$((count + 1))
    fi
  done <"$PATCHES_DIR/files_to_delete.txt"

  print_success "Removed $count of $total files/directories"
}

apply_patches() {
  print_step "Applying code patches..."

  local count=0
  local failed=0

  while IFS= read -r file; do
    patch_file="$PATCHES_DIR/diffs/$file.patch"
    target="$WORK_DIR/decompiled/$file"

    # Skip if this is a binary file (handled separately)
    if [ -f "$PATCHES_DIR/binary_replacements/$file" ]; then
      continue
    fi

    if [ -f "$patch_file" ] && [ -f "$target" ]; then
      if patch -s -N "$target" <"$patch_file" 2>/dev/null; then
        count=$((count + 1))
      else
        failed=$((failed + 1))
        print_warning "Failed to patch: $file"
      fi
    fi
  done <"$PATCHES_DIR/files_to_patch.txt"

  if [ $failed -gt 0 ]; then
    print_warning "Applied $count patches, $failed failed"
  else
    print_success "Applied $count patches successfully"
  fi
}

apply_binary_replacements() {
  print_step "Applying binary replacements..."

  local count=0

  if [ -d "$PATCHES_DIR/binary_replacements" ]; then
    while IFS= read -d '' -r file; do
      rel_path="${file#$PATCHES_DIR/binary_replacements/}"
      target="$WORK_DIR/decompiled/$rel_path"
      target_dir=$(dirname "$target")
      mkdir -p "$target_dir"
      cp "$file" "$target"
      count=$((count + 1))
    done < <(find "$PATCHES_DIR/binary_replacements" -type f -print0)
  fi

  print_success "Replaced $count binary files"
}

apply_additions() {
  print_step "Adding new files..."

  local count=0

  if [ -d "$PATCHES_DIR/new_files" ]; then
    cp -r "$PATCHES_DIR/new_files/"* "$WORK_DIR/decompiled/" 2>/dev/null || true
    count=$(find "$PATCHES_DIR/new_files" -type f | wc -l)
  fi

  print_success "Added $count new files"
}

rebuild_apk() {
  print_step "Rebuilding APK..."

  mkdir -p "$OUTPUT_DIR"

  apktool b "$WORK_DIR/decompiled" -o "$WORK_DIR/unsigned.apk" 2>&1 | tail -5

  print_success "APK rebuilt"
}

align_apk() {
  print_step "Aligning APK..."

  local zipalign_cmd=""

  if command -v zipalign &>/dev/null; then
    zipalign_cmd="zipalign"
  elif [ -n "$ANDROID_HOME" ]; then
    zipalign_cmd=$(find "$ANDROID_HOME/build-tools" -name "zipalign" | head -1)
  fi

  if [ -n "$zipalign_cmd" ]; then
    "$zipalign_cmd" -f -p 4 "$WORK_DIR/unsigned.apk" "$WORK_DIR/aligned.apk"
    mv "$WORK_DIR/aligned.apk" "$WORK_DIR/unsigned.apk"
    print_success "APK aligned"
  else
    print_warning "zipalign not found, skipping alignment"
  fi
}

sign_apk() {
  local target_apk="${1:-$OUTPUT_APK}"
  print_step "Signing APK -> $(basename "$target_apk")"

  if command -v apksigner &>/dev/null; then
    apksigner sign --ks "$KEYSTORE" \
      --ks-pass "pass:$KEYSTORE_PASS" \
      --ks-key-alias "$KEY_ALIAS" \
      --out "$target_apk" \
      "$WORK_DIR/unsigned.apk"
  elif [ -n "$ANDROID_HOME" ]; then
    local apksigner_cmd=$(find "$ANDROID_HOME/build-tools" -name "apksigner" | head -1)
    if [ -n "$apksigner_cmd" ]; then
      "$apksigner_cmd" sign --ks "$KEYSTORE" \
        --ks-pass "pass:$KEYSTORE_PASS" \
        --ks-key-alias "$KEY_ALIAS" \
        --out "$target_apk" \
        "$WORK_DIR/unsigned.apk"
    else
      jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
        -keystore "$KEYSTORE" \
        -storepass "$KEYSTORE_PASS" \
        -keypass "$KEYSTORE_PASS" \
        -signedjar "$target_apk" \
        "$WORK_DIR/unsigned.apk" "$KEY_ALIAS"
    fi
  else
    jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
      -keystore "$KEYSTORE" \
      -storepass "$KEYSTORE_PASS" \
      -keypass "$KEYSTORE_PASS" \
      -signedjar "$target_apk" \
      "$WORK_DIR/unsigned.apk" "$KEY_ALIAS" 2>&1 | tail -3
  fi

  print_success "APK signed: $(basename "$target_apk")"
}

# Build a single variant
build_variant() {
  local variant="$1"
  local package=$(get_variant_package "$variant")
  local output_apk=$(get_output_filename "$variant")

  echo ""
  echo -e "${BLUE}--- Building variant: $variant (package: $package) ---${NC}"

  # Restore manifest and replace package if not base
  restore_manifest
  replace_package_name "$package"

  # Rebuild
  rebuild_apk
  align_apk
  sign_apk "$output_apk"

  # Track built APKs (newline separated)
  if [ -z "$BUILT_APKS" ]; then
    BUILT_APKS="$output_apk"
  else
    BUILT_APKS="$BUILT_APKS
$output_apk"
  fi
}

cleanup() {
  print_step "Cleaning up..."
  rm -rf "$WORK_DIR"
  # Remove .idsig files (APK Signature Scheme v4) - not needed for distribution
  rm -f "$OUTPUT_DIR"/*.idsig
  print_success "Cleanup complete"
}

show_result() {
  echo ""
  echo -e "${GREEN}========================================${NC}"
  echo -e "${GREEN}  GameHub Lite build complete!${NC}"
  echo -e "${GREEN}========================================${NC}"
  echo ""

  if [ "$RELEASE" = "true" ]; then
    local count=$(echo "$BUILT_APKS" | wc -l | tr -d ' ')
    echo "Built $count APK variant(s):"
    echo ""
    echo "$BUILT_APKS" | while IFS= read -r apk; do
      if [ -n "$apk" ] && [ -f "$apk" ]; then
        local pkg=$(aapt dump badging "$apk" 2>/dev/null | grep "package:" | awk -F"'" '{print $2}' || echo "unknown")
        echo "  $(basename "$apk")"
        echo "    Package: $pkg"
        echo "    Size: $(du -h "$apk" | cut -f1)"
        echo ""
      fi
    done
  else
    echo "Output APK: $OUTPUT_APK"
    echo "Size: $(du -h "$OUTPUT_APK" | cut -f1)"
    echo ""
    echo "Install on your device:"
    echo "  adb install $OUTPUT_APK"
  fi
  echo ""
}

# String to track built APKs (newline-separated)
BUILT_APKS=""

main() {
  echo ""
  echo "====================================="
  echo "  GameHub Lite Patcher v5.3.5"
  echo "====================================="
  echo ""

  if [ "$RELEASE" = "true" ]; then
    echo -e "${YELLOW}RELEASE MODE: Building all variants${NC}"
    echo ""
  fi

  check_dependencies
  verify_source_apk
  setup_keystore
  decompile_apk

  # Normalize smali files to match patches (removes .line directives)
  normalize_smali_files

  # Extract version after decompilation
  extract_version

  apply_deletions
  apply_patches
  apply_binary_replacements
  apply_additions

  if [ "$RELEASE" = "true" ]; then
    # Backup manifest for variant builds
    backup_manifest

    # Build all variants (iterate over VARIANTS string)
    for pair in $VARIANTS; do
      local variant="${pair%%:*}"
      build_variant "$variant"
    done
  else
    # Standard single build
    rebuild_apk
    align_apk
    sign_apk "$OUTPUT_APK"
    BUILT_APKS="$OUTPUT_APK"
  fi

  cleanup
  show_result
}

# Run main function
main "$@"
