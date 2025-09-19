{
  'targets': [
    {
      'target_name': 'xwalk_test_browser',
      'type': 'executable',
      'defines!': ['CONTENT_IMPLEMENTATION'],
      'dependencies': [
        'xwalk_runtime',
      ],
      'include_dirs': [
        '..',
      ],
      'sources': [
        'test_browser.cc',
      ],
      'conditions': [
        ['OS=="win"', {
          'conditions': [
            ['win_use_allocator_shim==1', {
              'dependencies': [
                '../base/allocator/allocator.gyp:allocator',
              ],
            }],
          ],
          'dependencies': [
            '../sandbox/sandbox.gyp:sandbox',
          ],
          'sources': [
            '../content/app/sandbox_helper_win.cc',
          ],
          'msvs_settings': {
            'VCLinkerTool': {
              'SubSystem': '2',  # Set /SUBSYSTEM:WINDOWS
            },
          },
        }],
      ],
    },
  ],
}