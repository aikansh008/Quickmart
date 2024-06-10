import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class AnimationLoader extends StatelessWidget {
  const AnimationLoader(
      {super.key, required this.animation, required this.text, this.actiontext="",   this.showaction=false, this.onactionpressed});
  final String animation;
  final String text;
  final String actiontext;
  final VoidCallback ?onactionpressed;
  final bool showaction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          animation,
          width: THelperFunctions.screenWidth() * 0.8,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
     
      ],
    ));
  }
}
