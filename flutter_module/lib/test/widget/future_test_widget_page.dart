import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/stateless_common_widget.dart';
import 'package:flutter_module/main.dart';
import 'package:flutter_module/tab_component.dart';

class TestWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("async测试"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomerStatefulWidget(),
          CustomerStatelessWidget(),
          CustomerRenderWidget(),
          TabComponent()
        ],
      ),
    );
  }
}
