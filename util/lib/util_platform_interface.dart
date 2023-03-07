import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'util_method_channel.dart';

abstract class UtilPlatform extends PlatformInterface {
  /// Constructs a UtilPlatform.
  UtilPlatform() : super(token: _token);

  static final Object _token = Object();

  static UtilPlatform _instance = MethodChannelUtil();

  /// The default instance of [UtilPlatform] to use.
  ///
  /// Defaults to [MethodChannelUtil].
  static UtilPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UtilPlatform] when
  /// they register themselves.
  static set instance(UtilPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
