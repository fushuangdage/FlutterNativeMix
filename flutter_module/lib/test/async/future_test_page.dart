import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_module/common/stateless_common_widget.dart';
import 'package:flutter_module/main.dart';
import 'package:flutter_module/test/temp/loading_dialog.dart';
import 'package:flutter_module/test/utils/log_utils.dart';

class CustomerElement extends StatelessElement {
  CustomerElement(StatelessWidget widget) : super(widget);

  @override
  void unmount() {
    super.unmount();
    cusLog("CustomerElement unmount");
  }
}

class AsyncTestPage extends StatelessWidget {
  @override
  StatelessElement createElement() {
    return CustomerElement(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("async测试"),
      ),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
                onTap: () async {
                  // TestFutureUtil().runFuture(blockFuture: () async {
                  //   sleep(Duration(seconds: 3));
                  //   cusLog('in progress');
                  // });

                  // runAsync();
                  Future.delayed(Duration(seconds: 5), () {
                    cusLog("${context.hashCode}");
                    var find = context.findAncestorStateOfType<NavigatorState>();
                    cusLog("$find");
                    // Navigator.of(context);
                  });
                  cusLog("tap finish");
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Container(color: Colors.blueAccent, child: Text("点击1")),
                )),
            TempStatefulWidget(),
            GestureDetector(
                onTap: () {
                  cusLog('before runAsync');
                  cusLog(doAsync1());
                  cusLog('after runAsync');
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Container(
                    color: Colors.grey,
                  ),
                )),
            GestureDetector(
                onTap: () {
                  cusLog('before runAsync');
                  doAsync2();
                  cusLog('after runAsync');
                },
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  cusLog('before runAsync');
                  LoadingDialog.showCustomDialog(
                      context: context,
                      builder: (context) => LoadingDialog(
                            loadingFuture: (_) async {
                              // sleep(Duration(seconds: 5));
                               Future.delayed(Duration(seconds: 5), () {
                                cusLog("delay 5s");
                              });
                              cusLog("LoadingDialog");
                            },
                            afterLoadingFuture: () async {
                              cusLog("afterLoadingFuture");
                            },
                          ));
                  cusLog('after runAsync');
                },
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Future<int> doAsync() {
    return Future<int>(() {
      cusLog("go in doAsync");
      sleep(Duration(seconds: 2));
      cusLog("go out doAsync");
      return 1;
    });
    // cusLog("go in doAsync");
    // sleep(Duration(seconds: 2));
    // cusLog("go out doAsync");
    // return 1;
  }

  Future<int> doAsync1() async {
    cusLog("go in doAsync");
    sleep(Duration(seconds: 2));
    cusLog("go out doAsync");
    return 1;
  }

  int doAsync2() {
    sleep(Duration(seconds: 2));
    Future.value("doAsync2").then((value) => cusLog(value));
    return 2;
  }

  String doAsync3() {
    Future.error("doAsync3").catchError((e) {
      cusLog("error catch : $e");
    }).then((value) => cusLog("then : " + value));
    return "";
  }

  String doAsync4() {
    Future.delayed(Duration(seconds: 3), () {
      return "A";
    }).catchError((e) {
      cusLog("error catch : $e");
    }).then((value) => cusLog(value));
    return "";
  }

  Future<String?> doAsync5() async {
    // sleep(Duration(seconds: 2));
    cusLog('enter doAsync');
    await Future.delayed(Duration(seconds: 2), () {
      cusLog("Delay finish");
    }).then((value) => cusLog("run then"));
    cusLog('out doAsync');
  }

  Future<String?> doAsync6() async {
    // sleep(Duration(seconds: 2));
    cusLog('enter doAsync');
    await Future.delayed(Duration(seconds: 2), () {
      cusLog("Delay finish");
    });
    cusLog('out doAsync');
  }

  void doAsync7() {
    scheduleMicrotask(() {
      cusLog("log");
    });
  }

  // Future<int> runAsync() {
  //   return Future<int>(() {
  //     cusLog("go in runAsync");
  //     sleep(Duration(seconds: 3));
  //     cusLog("go out runAsync");
  //     return 1;
  //   });
  // }

  Future<int> runAsync() {
    cusLog("go in runAsync");
    // await Future.delayed(Duration(seconds: 3));
    sleep(Duration(seconds: 5));

    cusLog("go out runAsync");

    return Future.value(3);
  }
}

class TempStatefulWidget extends StatefulWidget {
  @override
  _TempStatefulWidgetState createState() => _TempStatefulWidgetState();
}

class _TempStatefulWidgetState extends State<TempStatefulWidget> {
  var flag = 0;

  @override
  Widget build(BuildContext context) {
    int id = 0;
    return GestureDetector(
      onTap: () async {
        print('onTao');
        await Future.delayed(Duration(seconds: 5), () {
          id = 1;
          context.widget;
          var mounted = (context as StatefulElement).state.mounted;
          flag++;
        });
      },
      child: flag % 2 == 1
          ? Container(
              color: Colors.deepOrangeAccent,
              child: SizedBox(
                height: 200,
                width: 200,
              ))
          : CustomerStatefulWidget(),
    );
  }
}
