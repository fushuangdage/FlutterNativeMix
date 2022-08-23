import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider测试"),
      ),
      body: Container(
          color: Colors.redAccent,
          child: ChangeNotifierProvider.value(
            value: DataModule(),
            child: Container(child: BizWidget(),),
          )),
    );
  }
}

class DataModule extends ChangeNotifier {
  String name="name1";
}

class BizWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   var data= Provider.of<DataModule>(context);
   return GestureDetector(child: Text(data.name),onTap: (){
     data.name="fs1";
     data.notifyListeners();
   },);
  }
}
