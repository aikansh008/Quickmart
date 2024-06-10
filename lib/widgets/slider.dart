import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageurl,
    this.applyImageRadius = true,
    this.border,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = ESizes.md,
    this.fit = BoxFit.contain,
  });
  final double? width, height;
  final String imageurl;
  final bool? applyImageRadius;
  final BoxBorder? border;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool? isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width:320,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image(
            fit:BoxFit.fill,
              image: AssetImage(imageurl),
              
              
            )));
  }
}
