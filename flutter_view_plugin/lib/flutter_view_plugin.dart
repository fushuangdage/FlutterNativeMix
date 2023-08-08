
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterViewPlugin {
  static const MethodChannel _channel = MethodChannel('flutter_view_plugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
