#!/bin/bash

# Crosswalk Test Browser Launch Script
# This script demonstrates how to launch the Crosswalk browser with minimal UI

echo "🌐 Launching Crosswalk Test Browser..."

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Set the test page path
TEST_PAGE="file://$SCRIPT_DIR/test_page.html"

echo "📄 Loading test page: $TEST_PAGE"

# Launch the Crosswalk browser with minimal UI mode
# This enables the address bar and navigation controls
if [ -f "$SCRIPT_DIR/out/Release/xwalk" ]; then
    echo "🚀 Starting browser from Release build..."
    $SCRIPT_DIR/out/Release/xwalk --display-mode=minimal-ui "$TEST_PAGE"
elif [ -f "$SCRIPT_DIR/out/Debug/xwalk" ]; then
    echo "🚀 Starting browser from Debug build..."
    $SCRIPT_DIR/out/Debug/xwalk --display-mode=minimal-ui "$TEST_PAGE"
else
    echo "❌ Error: Crosswalk browser not found!"
    echo "Please build the project first using:"
    echo "  python gyp_xwalk"
    echo "  ninja -C out/Release xwalk"
    exit 1
fi