import 'package:flutter/cupertino.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;

  CustomPageRoute({required this.child})
      : super(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> animationSecondary) =>
                child);

  @override
  Widget buildTransition(BuildContext context, Animation<double> animation,
          Animation<double> animationSecondary, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
            .animate(animation),
      );
}
