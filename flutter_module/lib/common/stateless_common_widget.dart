
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerStatefulWidget extends StatefulWidget {
  CustomerStatefulWidget({Key? key}) : super(key: key);

  @override
  _CustomerStatefulWidgetState createState() {
    return _CustomerStatefulWidgetState();
  }
}

class _CustomerStatefulWidgetState extends State<CustomerStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Text("CustomerStatefulWidget");
  }
}

class CustomerStatelessWidget extends StatefulWidget {
  CustomerStatelessWidget();

  @override
  _CustomerStatelessWidgetState createState() => _CustomerStatelessWidgetState();
}

class _CustomerStatelessWidgetState extends State<CustomerStatelessWidget> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CustomerStatelessWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("CustomerStatelessWidget");
  }
}

class CustomerRenderWidget extends RenderObjectWidget {
  @override
  RenderObjectElement createElement() {
    return new CustomerRenderElement(this);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomerRenderObject();
  }
}

class CustomerRenderElement extends RenderObjectElement {
  CustomerRenderElement(RenderObjectWidget widget) : super(widget);

  @override
  void removeRenderObjectChild(RenderObject child, dynamic slot) {
    super.removeRenderObjectChild(child, slot);
    print('CustomerRenderElement.removeRenderObjectChild');
  }

  @override
  void insertRenderObjectChild(RenderObject child, dynamic slot) {
    super.insertRenderObjectChild(child, slot);
    print('CustomerRenderElement.insertRenderObjectChild');
  }

  // @override
  // List<Element> updateChildren(List<Element> oldChildren, List<Widget> newWidgets,
  //     {Set<Element> forgottenChildren}) {
  //   super.updateChildren(oldChildren, newWidgets);
  //   print('CustomerRenderElement.updateChildren'android/app/build.gradle);
  // }

  @override
  void update(RenderObjectWidget newWidget) {
    super.update(newWidget);
    print('CustomerRenderElement.update');
  }

  @override
  void mount(Element? parent, dynamic newSlot) {
    super.mount(parent, newSlot);
    print('CustomerRenderElement.mount');
  }

  @override
  void unmount() {
    super.unmount();
    print('CustomerRenderElement.mount');
  }
}

class CustomerRenderObject extends RenderBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    print('CustomerRenderObject.paint');
    super.paint(context, offset);
    var drawOffset = Offset(offset.dx + 50, offset.dy + 50);
    context.canvas.drawCircle(drawOffset, 50, Paint()..color = Colors.blueAccent);
  }

  @override
  void performResize() {
    // TODO: implement performResize
    super.performResize();
  }

  @override
  void performLayout() {
    size = Size(100, 100);
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    print('CustomerRenderObject.computeMaxIntrinsicHeight');
    return 100;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    print('CustomerRenderObject.computeMinIntrinsicHeight');
    return 100;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    print('CustomerRenderObject.computeMaxIntrinsicWidth');
    return 100;
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    print('CustomerRenderObject.computeMinIntrinsicWidth');
    return 100;
  }
}
