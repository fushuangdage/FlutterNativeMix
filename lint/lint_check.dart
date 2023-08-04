import 'package:flutter/cupertino.dart';

// class ImageNetwork extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: strToColor('#8C8C8C'),
//     );
//   }
// }
//
// /// 把类似#7f7f7f这种颜色转换成color
// Color strToColor(String colorStr, {Color fallback}) {
//   if (colorStr == null) {
//     return fallback;
//   }
//   try {
//     return Color(int.parse(colorStr.replaceAll("#", "0xff")));
//   } catch (e, s) {
//     debugPrint("$e\n$s");
//   }
//   return fallback;
// }


class EventRegisterLintCheck {
  StreamSubscription? subscription;

  void onInit() {
    subscription = eventBus.on<Event>().listen((event) {

    });
  }

  void onClose() {
    subscription?.cancel();
  }
}
