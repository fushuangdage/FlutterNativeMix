import 'package:flutter/cupertino.dart';
import 'package:flutter_module/test/utils/log_utils.dart';

typedef AfterLoadingFuture = Future<void> Function();

class TestFutureUtil {
  void runFuture({required AfterLoadingFuture blockFuture}) {
    cusLog('before run future');
    blockFuture().then((value) => cusLog('in future then'));
    cusLog('after run future');
  }

  void runFuture1({int? number}) {
    cusLog('before run future');
    // blockFuture().then((value) => print('in future then'));
    cusLog('after run future');
  }
}
