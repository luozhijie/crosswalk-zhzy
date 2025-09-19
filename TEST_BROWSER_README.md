# Crosswalk Test Browser

A test browser application built on the Crosswalk runtime featuring URL navigation and minimal browser UI.

## Features

- ✅ **URL Address Bar**: Editable address bar that accepts URLs
- ✅ **Navigation Controls**: Back, Forward, Refresh, and Stop buttons  
- ✅ **Progress Indicator**: Loading progress bar in the address bar
- ✅ **Minimal UI Mode**: Clean, browser-like interface
- ✅ **URL Auto-completion**: Automatically adds `http://` prefix
- ✅ **Enter Key Navigation**: Press Enter in address bar to navigate

## Building the Test Browser

### Prerequisites

- Python 2.7 (for the build system)
- GYP build system
- Ninja build tool
- C++ compiler (GCC/Clang)

### Build Steps

1. **Generate build files:**
   ```bash
   python gyp_xwalk
   ```

2. **Build the browser:**
   ```bash
   ninja -C out/Release xwalk
   ```

3. **Launch the test browser:**
   ```bash
   ./launch_test_browser.sh
   ```

## Manual Launch

You can also launch the browser manually:

```bash
# Launch with minimal UI (browser controls)
./out/Release/xwalk --display-mode=minimal-ui file://$(pwd)/test_page.html

# Or navigate to any URL
./out/Release/xwalk --display-mode=minimal-ui https://www.google.com
```

## Usage

1. **Enter URLs**: Click in the address bar and type any URL
2. **Navigate**: Press Enter or use navigation buttons
3. **Browse**: Use Back/Forward buttons to navigate history
4. **Reload**: Click Refresh button to reload current page
5. **Stop**: Click Stop button to halt page loading

## URL Examples to Test

- `https://www.google.com`
- `github.com` (auto-prefixed to `http://github.com`)
- `https://www.wikipedia.org`
- `file:///path/to/local/file.html`

## Code Changes Made

The following modifications were made to enable URL input functionality:

### Modified Files

1. **`runtime/browser/ui/native_app_window_desktop.cc`**:
   - Changed `AddressView` from `views::Label` to `views::Textfield`
   - Added `TextfieldController` implementation for Enter key handling
   - Added URL navigation logic when Enter is pressed
   - Added placeholder text "Enter URL or search..."

2. **Added Files**:
   - `test_browser.cc` - Test browser application entry point
   - `test_page.html` - Sample test page with navigation features
   - `manifest.json` - Application manifest
   - `launch_test_browser.sh` - Launch script
   - `test_browser.gyp` - Build configuration for test browser

### Key Features Implemented

- **Editable Address Bar**: Users can click and type URLs
- **Enter Key Navigation**: Pressing Enter navigates to the entered URL
- **Auto URL Formatting**: Automatically adds `http://` prefix if missing
- **Visual Progress**: Loading progress bar appears during navigation
- **Navigation Controls**: All standard browser buttons work as expected

## Architecture

The test browser leverages the existing Crosswalk runtime infrastructure:

- **Runtime**: Core browser engine and content management
- **UI Delegate**: Desktop UI implementation with minimal browser chrome
- **Native App Window**: Views-based window with toolbar and web view
- **Address Bar**: Custom textfield with navigation capabilities

This implementation provides a functional browser testing environment suitable for web application development and testing.