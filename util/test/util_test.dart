import 'package:flutter_test/flutter_test.dart';
import 'package:util/util.dart';
import 'package:util/util_platform_interface.dart';
import 'package:util/util_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUtilPlatform
    with MockPlatformInterfaceMixin
    implements UtilPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final UtilPlatform initialPlatform = UtilPlatform.instance;

  test('$MethodChannelUtil is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUtil>());
  });

  test('getPlatformVersion', () async {
    Util utilPlugin = Util();
    MockUtilPlatform fakePlatform = MockUtilPlatform();
    UtilPlatform.instance = fakePlatform;

    expect(await utilPlugin.getPlatformVersion(), '42');
  });
}
