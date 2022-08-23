import 'package:flutter/material.dart';

class TouchDispatchTestPage extends StatefulWidget {
  @override
  _TouchDispatchTestPageState createState() => _TouchDispatchTestPageState();
}

class _TouchDispatchTestPageState extends State<TouchDispatchTestPage> {
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      print('scroll');
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [];
    for (var i = 0; i <= 20; i++) {
      data.add("value");
    }

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print('on tap');
              scrollController.animateTo(0,
                  duration: Duration(seconds: 3), curve: Curves.linearToEaseOut);
            },
            onVerticalDragDown: (details) {
              print('onVerticalDragDown');
            },
            onVerticalDragUpdate: (details) {
              print('onVerticalDragUpdate');
            },
            onLongPressMoveUpdate: (details) {
              print('onLongPressMoveUpdate');
            },
            onLongPress: () {
              print('onLongPress');
            },
            onTapDown: (event) {
              print('on tap down');
            },
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.red,
              child: GestureDetector(onTapDown: (event){
                print('on tap down>>>>>>>');

              },child: UnconstrainedBox(child: Container(height: 100,width: 100,color: Colors.pinkAccent,child: Text("11111"),))),
            ),
          ),
          ...data
              .map((e) => Container(
                    height: 100,
                    color: Colors.deepOrangeAccent,
                    width: double.infinity,
                    child: Center(
                      child: Text(e.toString()),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
