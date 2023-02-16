import 'package:flutter/material.dart';
import 'package:flutter_module/common/stateless_common_widget.dart';

class ScrollTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollTestStatus();
  }
}

class ScrollTestStatus extends State {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          ),
        ),
        SliverFillRemaining(
            child: CustomerRenderWidget(
        ))
      ],
    );
  }
}
