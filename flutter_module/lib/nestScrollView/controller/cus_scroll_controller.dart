import 'package:flutter/cupertino.dart';

class CusScrollController extends ScrollController {
  @override
  ScrollPosition createScrollPosition(
      ScrollPhysics physics, ScrollContext context, ScrollPosition? oldPosition) {
    // TODO: implement createScrollPosition
    return CusScrollPosition(physics: physics, context: context);
  }
}

class CusScrollPosition extends ScrollPositionWithSingleContext {
  CusScrollPosition({required super.physics, required super.context});

  @override
  double get maxScrollExtent => super.maxScrollExtent;

  @override
  bool applyContentDimensions(double minScrollExtent, double maxScrollExtent) {
    // TODO: implement applyContentDimensions
    return super.applyContentDimensions(minScrollExtent, maxScrollExtent - 150);
  }
}
