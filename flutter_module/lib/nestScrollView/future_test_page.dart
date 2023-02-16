import 'package:flutter/material.dart';

class NestScrollTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list1 = ["a", "b", "c"];

    var list2 = List.from(list1);

    list1.add("d");

    print(list2.length);

    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 380,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  //头部整个背景颜色
                  color: Color(0xffcccccc),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: Container(
                  color: Colors.blueAccent,
                  child: Column(
                    children: <Widget>[Text("data"), Text("data1"), Text("data2")],
                  ),
                ),
              ),
            )
          ];
        },
        body: Container(
          height: 1000,
          color: Colors.pinkAccent,
        ));
  }
}
