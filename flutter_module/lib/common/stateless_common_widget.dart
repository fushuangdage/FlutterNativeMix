import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

class CustomerStatelessWidget extends StatelessWidget {
  CustomerStatelessWidget();

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
    size = Size(300, 300);
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

class CustomerSingChildWidget extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomerSingChildRenderObject();
  }
}

class CustomerSingChildRenderObject extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  @override
  void performLayout() {
    // TODO: implement performLayout
    super.performLayout();

    child?.layout(constraints.loosen(), parentUsesSize: false);
    size = Size(300, 300);
    BoxParentData? parentData = child?.parentData as BoxParentData?;
    parentData?.offset = ((size - child!.size) as Offset) / 2;
  }
}
