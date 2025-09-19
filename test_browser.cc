// Copyright (c) 2024 Crosswalk Browser Test Application
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "base/command_line.h"
#include "content/public/app/content_main.h"
#include "xwalk/runtime/app/xwalk_main_delegate.h"
#include "xwalk/runtime/browser/runtime.h"
#include "xwalk/runtime/browser/xwalk_browser_context.h"
#include "xwalk/runtime/browser/xwalk_runner.h"

// Simple browser test application entry point
int main(int argc, const char** argv) {
  // Initialize command line with default URL if none provided
  base::CommandLine::Init(argc, argv);
  base::CommandLine* command_line = base::CommandLine::ForCurrentProcess();
  
  // Add the minimal UI mode switch to enable browser-like interface
  if (!command_line->HasSwitch("display-mode")) {
    command_line->AppendSwitchASCII("display-mode", "minimal-ui");
  }
  
  // Set a default URL if none provided
  if (command_line->GetArgs().empty()) {
    command_line->AppendArg("https://www.google.com");
  }

  // Use the existing XWalk main delegate for browser functionality
  xwalk::XWalkMainDelegate delegate;
  content::ContentMainParams params(&delegate);
  params.argc = argc;
  params.argv = argv;
  
  return content::ContentMain(params);
}