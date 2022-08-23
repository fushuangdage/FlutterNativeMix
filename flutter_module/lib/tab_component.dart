import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabComponent extends StatefulWidget {
  @override
  _TabComponentState createState() => _TabComponentState();
}

class _TabComponentState extends State<TabComponent> with SingleTickerProviderStateMixin {
  TabController? tabController;
  var tabs=[Text("tab1"), Text("tab2"), Text("tab3")].map((e) => Container(child: e,decoration: BoxDecoration(color: Colors.red),)).toList();

  @override
  Widget build(BuildContext context) {


    return Container(
        child: Expanded(
            child: Column(
      children: [
        TabBar(controller: tabController,tabs:tabs)
      ],
    )));
  }

  @override
  void initState() {
    tabController = TabController(initialIndex: 2,length: 3,vsync: this)..addListener(() {
        // tabs.clear();
    });
  }
}
