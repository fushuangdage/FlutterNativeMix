import 'package:flutter/material.dart';
import 'package:flutter_module/test/utils/log_utils.dart';

class CustomerElement extends StatelessElement {
  CustomerElement(StatelessWidget widget) : super(widget);

  @override
  void unmount() {
    super.unmount();
    cusLog("CustomerElement unmount");
  }
}

class RegexpTestPage extends StatelessWidget {
  @override
  StatelessElement createElement() {
    return CustomerElement(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regexp测试"),
      ),
      body: Container(
        color: Colors.redAccent,
        child: SizedBox(height: 100,width: 100,child: GestureDetector(onTap: (){
          var input = "[10,90]";
          RegExp reg = new RegExp(r"(\d+)");
          var result = reg.allMatches(input).toList();
          result.forEach((element) {
            print('${element.group(0)}');
          });
        },),),
      ),
    );
  }

}
