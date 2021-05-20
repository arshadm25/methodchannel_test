#import "MethodchannelTestPlugin.h"
#if __has_include(<methodchannel_test/methodchannel_test-Swift.h>)
#import <methodchannel_test/methodchannel_test-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "methodchannel_test-Swift.h"
#endif

@implementation MethodchannelTestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMethodchannelTestPlugin registerWithRegistrar:registrar];
}
@end
