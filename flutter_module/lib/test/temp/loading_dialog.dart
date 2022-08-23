import 'package:flutter/material.dart';

typedef Future<void> LoadingFuture(BuildContext context);
typedef Future<void> AfterLoadingFuture();

class LoadingDialog extends StatefulWidget {
  /// Future返回时对话框消失
  final LoadingFuture loadingFuture;
  final AfterLoadingFuture afterLoadingFuture;

  const LoadingDialog({
    Key? key,
     required this.loadingFuture,
     required this.afterLoadingFuture,
  }) : super(key: key);

  @override
  _LoadingDialogState createState() => _LoadingDialogState();


  static Future<T?> showCustomDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    final ThemeData theme = Theme.of(context);
    return showGeneralDialog(
      context: context,
      pageBuilder: (
          BuildContext buildContext,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          ) {
        final Widget pageChild = builder(buildContext);
        return SafeArea(
          child: Builder(builder: (_) => Theme(data: theme, child: pageChild)),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black.withOpacity(.3),
      transitionDuration: const Duration(milliseconds: 150),
    );
  }
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  void initState() {
    super.initState();
    widget.loadingFuture(context).then((_) {
      // if (mounted) {
      //   Navigator.of(context).pop();
      // }
      widget.afterLoadingFuture();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          //弹框背景和圆角
          width: 100,
          height: 100,
          decoration: ShapeDecoration(
            color: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: new Text(
                  "提交中....",
                  style: new TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


