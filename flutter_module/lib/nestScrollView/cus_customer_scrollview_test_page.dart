import 'package:flutter/material.dart';
import 'package:flutter_module/nestScrollView/controller/cus_scroll_controller.dart';
import 'package:flutter_module/nestScrollView/cus_customer_scrollView.dart';

class CusCustomScrollTestPage extends StatelessWidget {
  CusScrollController outController = CusScrollController();

  @override
  Widget build(BuildContext context) {
    return CusCustomScrollView(
      controller: outController,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 150,
            color: Colors.amberAccent,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            color: Colors.deepPurpleAccent,
          ),
        ),
        SliverFillRemaining(
          child: Container(
            color: Colors.purpleAccent,
            child: Column(
              children: [
                _buildItem(),
                _buildItem(),
                _buildItem(),
                _buildItem(),
                _buildItem(),
                _buildItem(),
                _buildItem(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildItem({int index = 0}) {
    return Container(
      height: 70,
      child: Text("条目: $index"),
    );
  }
}
