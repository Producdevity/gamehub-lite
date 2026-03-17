#!/bin/bash
#
# GameHub Lite - ReVanced Patch Applier
# Applies ReVanced patches to GameHub 5.3.5 APK
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATCHES_JAR="$SCRIPT_DIR/build/libs/gamehub-lite-patches.jar"
CLI_JAR="$SCRIPT_DIR/tools/revanced-cli.jar"
OUTPUT_DIR="$SCRIPT_DIR/output"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_step() {
    echo -e "${BLUE}==>${NC} $1"
}

print_success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

show_usage() {
    echo "Usage: $0 <input-apk> [options]"
    echo ""
    echo "Options:"
    echo "  -o, --output <file>    Output APK path (default: output/GameHub-Lite.apk)"
    echo "  -p, --patches <list>   Comma-separated list of patches to apply"
    echo "  -l, --list             List available patches"
    echo "  -h, --help             Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 GameHub-5.3.5.apk"
    echo "  $0 GameHub-5.3.5.apk -o my-output.apk"
    echo "  $0 GameHub-5.3.5.apk -p \"Disable All Telemetry,GameHub Lite\""
}

check_dependencies() {
    print_step "Checking dependencies..."

    if ! command -v java &> /dev/null; then
        print_error "Java is required but not installed"
        echo "Install Java 17+: brew install openjdk@17"
        exit 1
    fi

    if [ ! -f "$CLI_JAR" ]; then
        print_warning "ReVanced CLI not found. Downloading..."
        download_cli
    fi

    if [ ! -f "$PATCHES_JAR" ]; then
        print_warning "Patches JAR not found. Building..."
        build_patches
    fi

    print_success "All dependencies ready"
}

download_cli() {
    mkdir -p "$SCRIPT_DIR/tools"

    # Get latest ReVanced CLI release
    local cli_url="https://github.com/ReVanced/revanced-cli/releases/download/v5.0.1/revanced-cli-5.0.1-all.jar"

    print_step "Downloading ReVanced CLI..."
    curl -fL --retry 3 --connect-timeout 15 -o "$CLI_JAR" "$cli_url"

    if [ -s "$CLI_JAR" ]; then
        print_success "ReVanced CLI downloaded"
    else
        print_error "Failed to download ReVanced CLI"
        exit 1
    fi
}

build_patches() {
    print_step "Building patches..."

    cd "$SCRIPT_DIR"

    if [ -f "gradlew" ]; then
        ./gradlew build jar
    else
        print_error "Gradle wrapper not found. Run 'gradle wrapper' first"
        exit 1
    fi

    if [ -f "$PATCHES_JAR" ]; then
        print_success "Patches built successfully"
    else
        print_error "Failed to build patches"
        exit 1
    fi
}

list_patches() {
    print_step "Available patches:"

    java -jar "$CLI_JAR" list-patches \
        -p "$PATCHES_JAR"
}

apply_patches() {
    local input_apk="$1"
    local output_apk="${2:-$OUTPUT_DIR/GameHub-Lite.apk}"
    local patch_list="$3"

    if [ ! -f "$input_apk" ]; then
        print_error "Input APK not found: $input_apk"
        exit 1
    fi

    mkdir -p "$(dirname "$output_apk")"

    print_step "Applying patches to $(basename "$input_apk")..."

    local cmd=(java -jar "$CLI_JAR" patch -p "$PATCHES_JAR" -o "$output_apk")

    if [ -n "$patch_list" ]; then
        # Apply specific patches
        IFS=',' read -ra PATCHES <<< "$patch_list"
        for patch in "${PATCHES[@]}"; do
            cmd+=(-e "$patch")
        done
    fi

    cmd+=("$input_apk")

    "${cmd[@]}"

    if [ -f "$output_apk" ]; then
        print_success "Patched APK created: $output_apk"
        echo ""
        echo "Install with: adb install $output_apk"
    else
        print_error "Failed to create patched APK"
        exit 1
    fi
}

# Parse arguments
INPUT_APK=""
OUTPUT_APK=""
PATCH_LIST=""
LIST_ONLY=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -o|--output)
            OUTPUT_APK="$2"
            shift 2
            ;;
        -p|--patches)
            PATCH_LIST="$2"
            shift 2
            ;;
        -l|--list)
            LIST_ONLY=true
            shift
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            if [ -z "$INPUT_APK" ]; then
                INPUT_APK="$1"
            fi
            shift
            ;;
    esac
done

# Main
echo ""
echo "======================================="
echo "  GameHub Lite - ReVanced Patcher"
echo "======================================="
echo ""

check_dependencies

if [ "$LIST_ONLY" = true ]; then
    list_patches
    exit 0
fi

if [ -z "$INPUT_APK" ]; then
    print_error "No input APK specified"
    echo ""
    show_usage
    exit 1
fi

apply_patches "$INPUT_APK" "$OUTPUT_APK" "$PATCH_LIST"
