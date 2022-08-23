import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 初始化MethodChannel
const platform = MethodChannel('common.test.channel');

class ChannelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Provider测试"),
        ),
        body: Container(
          color: Colors.redAccent,
          child: GestureDetector(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.pinkAccent,
              ),
              onTap: () async{
                // var result=await platform.invokeMethod("show_toast", {"type": 1, "content": "toast content"});
                // print('result = $result');

                platform.invokeMethod("show_toast", {"type": 1, "content": "toast content"}).then((value) =>
                    print('result = $value'));
              }),
        ));
  }
}
