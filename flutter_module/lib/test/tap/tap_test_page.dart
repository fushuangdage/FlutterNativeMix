import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TapTestStatus();
  }
}

class TapTestStatus extends State {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        List<String?> list=["a","b",null];

        // setState(() {
        //   count++;
        // });
      },
      child: Container(
          color: Colors.pinkAccent,
          child: SizedBox(
            child: Center(
              child: Text("$count"),
            ),
            height: 200,
            width: 200,
          )),
    );
  }
}
