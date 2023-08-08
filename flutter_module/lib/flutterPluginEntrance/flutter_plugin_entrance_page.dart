import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_plugin/flutter_view_plugin.dart';

class FlutterPluginEntrancePage extends StatefulWidget {
  @override
  State<FlutterPluginEntrancePage> createState() => _FlutterPluginEntrancePageState();
}

class _FlutterPluginEntrancePageState extends State<FlutterPluginEntrancePage> {
  var platformVersion = "";

  @override
  void initState() {
    super.initState();
    getPlatformVersion().then((value) => setState(() {
          platformVersion = value??"v";
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter")),
      body: Container(
        child: Text("${platformVersion}"),
        alignment: Alignment.center,
      ),
    );
  }

  Future<String?> getPlatformVersion() async {
    return await FlutterViewPlugin.platformVersion;
  }
}
