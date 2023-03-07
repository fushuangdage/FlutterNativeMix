
import 'util_platform_interface.dart';

class Util {
  Future<String?> getPlatformVersion() {
    return UtilPlatform.instance.getPlatformVersion();
  }
}
