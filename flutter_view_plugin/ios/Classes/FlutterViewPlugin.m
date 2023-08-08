#import "FlutterViewPlugin.h"
#if __has_include(<flutter_view_plugin/flutter_view_plugin-Swift.h>)
#import <flutter_view_plugin/flutter_view_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_view_plugin-Swift.h"
#endif

@implementation FlutterViewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterViewPlugin registerWithRegistrar:registrar];
}
@end
