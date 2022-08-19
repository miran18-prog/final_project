import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLodingWidget extends StatelessWidget {
  const CustomLodingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.beat(color: Colors.blue, size: 50));
  }
}
