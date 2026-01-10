#!/bin/bash
#
# GameHub Lite Patch Generator for v5.3.5
# Generates patch files from original and modified APKs
# For developers maintaining the patch set
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DECOMPILED_DIR="$SCRIPT_DIR/decompiled"
PATCHES_DIR="$SCRIPT_DIR/patches535"

ORIGINAL_APK="${1:-$SCRIPT_DIR/apk/GameHub-5.3.5.apk}"
LITE_APK="${2:-$SCRIPT_DIR/apk/GameHub-Lite-5.3.5.apk}"

print_step() {
    echo -e "${BLUE}==>${NC} $1"
}

print_success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_apks() {
    print_step "Checking APK files..."

    if [ ! -f "$ORIGINAL_APK" ]; then
        print_error "Original APK not found: $ORIGINAL_APK"
        exit 1
    fi

    if [ ! -f "$LITE_APK" ]; then
        print_error "Lite APK not found: $LITE_APK"
        exit 1
    fi

    print_success "Found both APKs"
}

decompile_apks() {
    print_step "Decompiling APKs (this may take a few minutes)..."

    rm -rf "$DECOMPILED_DIR"
    mkdir -p "$DECOMPILED_DIR"

    echo "  Decompiling original..."
    apktool d -f "$ORIGINAL_APK" -o "$DECOMPILED_DIR/original" 2>&1 | tail -3

    echo "  Decompiling lite..."
    apktool d -f "$LITE_APK" -o "$DECOMPILED_DIR/lite" 2>&1 | tail -3

    print_success "Both APKs decompiled"
}

generate_file_lists() {
    print_step "Generating file lists..."

    rm -rf "$PATCHES_DIR"
    mkdir -p "$PATCHES_DIR"

    # Files only in original (to delete)
    # Handle both files and directories
    >"$PATCHES_DIR/files_to_delete.txt"
    while IFS= read -r line; do
        # Extract path from "Only in /path/to/dir: filename" format
        dir=$(echo "$line" | sed "s|Only in $DECOMPILED_DIR/original||" | sed 's|: .*||' | sed 's|^/||')
        name=$(echo "$line" | sed 's|.*: ||')
        if [ -n "$dir" ]; then
            path="$dir/$name"
        else
            path="$name"
        fi
        full_path="$DECOMPILED_DIR/original/$path"

        if [ -d "$full_path" ]; then
            # It's a directory - list all files recursively
            find "$full_path" -type f | sed "s|$DECOMPILED_DIR/original/||" >>"$PATCHES_DIR/files_to_delete.txt"
        else
            echo "$path" >>"$PATCHES_DIR/files_to_delete.txt"
        fi
    done < <(diff -rq "$DECOMPILED_DIR/original" "$DECOMPILED_DIR/lite" 2>/dev/null | grep "Only in $DECOMPILED_DIR/original")

    # Files only in lite (to add)
    # Handle both files and directories
    >"$PATCHES_DIR/files_to_add.txt"
    while IFS= read -r line; do
        # Extract path from "Only in /path/to/dir: filename" format
        dir=$(echo "$line" | sed "s|Only in $DECOMPILED_DIR/lite||" | sed 's|: .*||' | sed 's|^/||')
        name=$(echo "$line" | sed 's|.*: ||')
        if [ -n "$dir" ]; then
            path="$dir/$name"
        else
            path="$name"
        fi
        full_path="$DECOMPILED_DIR/lite/$path"

        if [ -d "$full_path" ]; then
            # It's a directory - list all files recursively
            find "$full_path" -type f | sed "s|$DECOMPILED_DIR/lite/||" >>"$PATCHES_DIR/files_to_add.txt"
        else
            echo "$path" >>"$PATCHES_DIR/files_to_add.txt"
        fi
    done < <(diff -rq "$DECOMPILED_DIR/original" "$DECOMPILED_DIR/lite" 2>/dev/null | grep "Only in $DECOMPILED_DIR/lite")

    # Files that differ (to patch)
    diff -rq "$DECOMPILED_DIR/original" "$DECOMPILED_DIR/lite" 2>/dev/null |
        grep "^Files" |
        awk '{print $2}' |
        sed "s|$DECOMPILED_DIR/original/||" >"$PATCHES_DIR/files_to_patch.txt"

    local del_count=$(wc -l <"$PATCHES_DIR/files_to_delete.txt")
    local add_count=$(wc -l <"$PATCHES_DIR/files_to_add.txt")
    local patch_count=$(wc -l <"$PATCHES_DIR/files_to_patch.txt")

    print_success "Found: $del_count deletions, $add_count additions, $patch_count modifications"
}

is_binary_file() {
    local file="$1"
    local ext="${file##*.}"

    # Files in original/ directory are binary copies kept by apktool
    if [[ "$file" == original/* ]]; then
        return 0
    fi

    case "$ext" in
    png | jpg | jpeg | gif | webp | mp3 | wav | ogg | mp4 | webm | so | ttf | otf | woff | woff2 | 9)
        return 0
        ;;
    *)
        return 1
        ;;
    esac
}

generate_patches() {
    print_step "Generating unified diff patches..."

    mkdir -p "$PATCHES_DIR/diffs"
    mkdir -p "$PATCHES_DIR/binary_replacements"

    local text_count=0
    local binary_count=0

    while IFS= read -r file; do
        if is_binary_file "$file"; then
            # Copy binary files directly instead of trying to patch
            dir=$(dirname "$PATCHES_DIR/binary_replacements/$file")
            mkdir -p "$dir"
            cp "$DECOMPILED_DIR/lite/$file" "$PATCHES_DIR/binary_replacements/$file"
            ((binary_count++))
        else
            # Generate unified diff for text files with portable paths
            dir=$(dirname "$PATCHES_DIR/diffs/$file")
            mkdir -p "$dir"
            diff -u \
                --label "a/$file" \
                --label "b/$file" \
                "$DECOMPILED_DIR/original/$file" "$DECOMPILED_DIR/lite/$file" \
                >"$PATCHES_DIR/diffs/$file.patch" 2>/dev/null || true
            ((text_count++))
        fi
    done <"$PATCHES_DIR/files_to_patch.txt"

    print_success "Generated $text_count text patches, $binary_count binary replacements"
}

copy_new_files() {
    print_step "Copying new files..."

    mkdir -p "$PATCHES_DIR/new_files"

    local count=0
    while IFS= read -r file; do
        dir=$(dirname "$PATCHES_DIR/new_files/$file")
        mkdir -p "$dir"
        if [ -f "$DECOMPILED_DIR/lite/$file" ]; then
            cp "$DECOMPILED_DIR/lite/$file" "$PATCHES_DIR/new_files/$file"
            ((count++))
        fi
    done <"$PATCHES_DIR/files_to_add.txt"

    print_success "Copied $count new files"
}

generate_stats() {
    print_step "Generating patch statistics..."

    local orig_size=$(du -sh "$DECOMPILED_DIR/original" | cut -f1)
    local lite_size=$(du -sh "$DECOMPILED_DIR/lite" | cut -f1)
    local patches_size=$(du -sh "$PATCHES_DIR" | cut -f1)

    cat >"$PATCHES_DIR/stats.txt" <<EOF
GameHub Lite Patch Statistics
==============================
Generated: $(date)

Source APKs:
  Original: $(basename "$ORIGINAL_APK")
  Lite: $(basename "$LITE_APK")

Decompiled sizes:
  Original: $orig_size
  Lite: $lite_size

Changes:
  Files to delete: $(wc -l <"$PATCHES_DIR/files_to_delete.txt")
  Files to add: $(wc -l <"$PATCHES_DIR/files_to_add.txt")
  Files to patch: $(wc -l <"$PATCHES_DIR/files_to_patch.txt")

Patches directory size: $patches_size
EOF

    cat "$PATCHES_DIR/stats.txt"
}

cleanup() {
    print_step "Cleaning up decompiled directories..."
    rm -rf "$DECOMPILED_DIR"
    print_success "Cleanup complete"
}

main() {
    echo ""
    echo "======================================="
    echo "  GameHub Lite Patch Generator"
    echo "======================================="
    echo ""

    check_apks
    decompile_apks
    generate_file_lists
    generate_patches
    copy_new_files
    generate_stats
    cleanup

    echo ""
    echo -e "${GREEN}Patches generated successfully!${NC}"
    echo "Patches directory: $PATCHES_DIR"
    echo ""
}

main "$@"
