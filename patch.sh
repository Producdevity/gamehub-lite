#!/bin/bash
#
# GameHub Lite Patcher
# Applies patches to GameHub 5.1.0 APK to create GameHub Lite
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
PATCHES_DIR="$SCRIPT_DIR/patches"
WORK_DIR="$SCRIPT_DIR/work"
OUTPUT_DIR="$SCRIPT_DIR/output"
KEYSTORE="$SCRIPT_DIR/keystore/debug.keystore"
KEYSTORE_PASS="android"
KEY_ALIAS="androiddebugkey"

# Source APK (can be overridden)
SOURCE_APK="${1:-$SCRIPT_DIR/apk/GameHub-5.1.0.apk}"
OUTPUT_APK="$OUTPUT_DIR/GameHub-Lite.apk"

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

check_dependencies() {
    print_step "Checking dependencies..."

    local missing=()

    if ! command -v apktool &> /dev/null; then
        missing+=("apktool")
    fi

    if ! command -v java &> /dev/null; then
        missing+=("java")
    fi

    if ! command -v zipalign &> /dev/null && ! command -v "$ANDROID_HOME/build-tools/"*/zipalign &> /dev/null; then
        print_warning "zipalign not found - APK may not be optimized"
    fi

    if ! command -v apksigner &> /dev/null && ! command -v jarsigner &> /dev/null; then
        missing+=("apksigner or jarsigner")
    fi

    if [ ${#missing[@]} -ne 0 ]; then
        print_error "Missing dependencies: ${missing[*]}"
        echo ""
        echo "Install instructions:"
        echo "  macOS:   brew install apktool openjdk"
        echo "  Ubuntu:  sudo apt install apktool openjdk-17-jdk"
        exit 1
    fi

    print_success "All dependencies found"
}

verify_source_apk() {
    print_step "Verifying source APK..."

    if [ ! -f "$SOURCE_APK" ]; then
        print_error "Source APK not found: $SOURCE_APK"
        echo ""
        echo "Please provide GameHub 5.1.0 APK as first argument or place it at:"
        echo "  $SCRIPT_DIR/apk/GameHub-5.1.0.apk"
        exit 1
    fi

    # Calculate MD5 of source APK
    local md5
    if command -v md5sum &> /dev/null; then
        md5=$(md5sum "$SOURCE_APK" | awk '{print $1}')
    else
        md5=$(md5 -q "$SOURCE_APK")
    fi

    # Expected MD5 for GameHub 5.1.0
    local expected_md5="f7c2e5a1b3d4e6f8a9b0c1d2e3f4a5b6"  # Replace with actual MD5

    print_success "Source APK found: $(basename "$SOURCE_APK")"
    echo "         MD5: $md5"
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

apply_deletions() {
    print_step "Removing telemetry and unnecessary files..."

    local count=0
    local total=$(wc -l < "$PATCHES_DIR/files_to_delete.txt")

    while IFS= read -r file; do
        target="$WORK_DIR/decompiled/$file"
        if [ -e "$target" ]; then
            rm -rf "$target"
            count=$((count + 1))
        fi
    done < "$PATCHES_DIR/files_to_delete.txt"

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
            if patch -s -N "$target" < "$patch_file" 2>/dev/null; then
                count=$((count + 1))
            else
                failed=$((failed + 1))
                print_warning "Failed to patch: $file"
            fi
        fi
    done < "$PATCHES_DIR/files_to_patch.txt"

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

    if command -v zipalign &> /dev/null; then
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
    print_step "Signing APK..."

    if command -v apksigner &> /dev/null; then
        apksigner sign --ks "$KEYSTORE" \
            --ks-pass "pass:$KEYSTORE_PASS" \
            --ks-key-alias "$KEY_ALIAS" \
            --out "$OUTPUT_APK" \
            "$WORK_DIR/unsigned.apk"
    elif [ -n "$ANDROID_HOME" ]; then
        local apksigner_cmd=$(find "$ANDROID_HOME/build-tools" -name "apksigner" | head -1)
        if [ -n "$apksigner_cmd" ]; then
            "$apksigner_cmd" sign --ks "$KEYSTORE" \
                --ks-pass "pass:$KEYSTORE_PASS" \
                --ks-key-alias "$KEY_ALIAS" \
                --out "$OUTPUT_APK" \
                "$WORK_DIR/unsigned.apk"
        else
            jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
                -keystore "$KEYSTORE" \
                -storepass "$KEYSTORE_PASS" \
                -keypass "$KEYSTORE_PASS" \
                -signedjar "$OUTPUT_APK" \
                "$WORK_DIR/unsigned.apk" "$KEY_ALIAS"
        fi
    else
        jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
            -keystore "$KEYSTORE" \
            -storepass "$KEYSTORE_PASS" \
            -keypass "$KEYSTORE_PASS" \
            -signedjar "$OUTPUT_APK" \
            "$WORK_DIR/unsigned.apk" "$KEY_ALIAS" 2>&1 | tail -3
    fi

    print_success "APK signed"
}

cleanup() {
    print_step "Cleaning up..."
    rm -rf "$WORK_DIR"
    print_success "Cleanup complete"
}

show_result() {
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  GameHub Lite build complete!${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo "Output APK: $OUTPUT_APK"
    echo "Size: $(du -h "$OUTPUT_APK" | cut -f1)"
    echo ""
    echo "Install on your device:"
    echo "  adb install $OUTPUT_APK"
    echo ""
}

main() {
    echo ""
    echo "====================================="
    echo "  GameHub Lite Patcher v1.0"
    echo "====================================="
    echo ""

    check_dependencies
    verify_source_apk
    setup_keystore
    decompile_apk
    apply_deletions
    apply_patches
    apply_binary_replacements
    apply_additions
    rebuild_apk
    align_apk
    sign_apk
    cleanup
    show_result
}

# Run main function
main "$@"
