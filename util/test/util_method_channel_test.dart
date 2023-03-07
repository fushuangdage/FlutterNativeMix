import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:util/util_method_channel.dart';

void main() {
  MethodChannelUtil platform = MethodChannelUtil();
  const MethodChannel channel = MethodChannel('util');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
