import 'package:flutter/material.dart';
import 'package:flutter_module/nestScrollView/future_test_page.dart';
import 'package:flutter_module/test/async/future_test_page.dart';
import 'package:flutter_module/test/channel/channel_page.dart';
import 'package:flutter_module/test/provider/provider_test_page.dart';
import 'package:flutter_module/test/regexp/regexp_test_page.dart';
import 'package:flutter_module/test/tap/tap_test_page.dart';
import 'package:flutter_module/test/touchDispatch/future_touch_dispatch_page.dart';
import 'package:flutter_module/test/widget/future_test_widget_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageStatus();
  }
}

class _MyHomePageStatus extends State<MyHomePage> {
  int _count = 0;
  GlobalKey globalKey = GlobalKey(debugLabel: "testKey");

  @override
  Widget build(BuildContext context) {
    // var widgetList=[];
    // var widget=widgetList[5];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
      ),
      appBar: AppBar(
        title: Text("测试"),
      ),
      body: Container(
          child: ListView(children: [
        Text("Flutter Demo Home Page : {$_count}"),
        GestureDetector(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text("asyncTest"),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AsyncTestPage();
            }));
          },
        ),
        GestureDetector(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text("testWidget"),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TestWidgetPage();
            }));
          },
        ),
        GestureDetector(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text("nestScroll"),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NestScrollTestPage();
            }));
          },
        ),
        GestureDetector(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text("Regexp"),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RegexpTestPage();
            }));
          },
        ),
        GestureDetector(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text("TouchDispatch"),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TouchDispatchTestPage();
            }));
          },
        ),
        GestureDetector(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text("clickTest"),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TapTestPage();
            }));
          },
        ),
        GestureDetector(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text("providerTest"),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProviderTestPage();
            }));
          },
        ),
        GestureDetector(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text("channelTest"),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ChannelPage();
            }));
          },
        ),
      ])),
    );
  }
}

void test() {}
