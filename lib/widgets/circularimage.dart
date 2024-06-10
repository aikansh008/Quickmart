import 'package:flutter/material.dart';


class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
     this.dark=true,
      this.height=50,
       this.width=50,
        this.padding=0,
        required this.image,
  });

  final bool dark;
  final double height;
  final double width;
  final double padding;
  final String image;
  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(

            color: dark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(100)),
        child: Image(
          image: AssetImage(image),
          color: dark ? Colors.white : Colors.black,
        ));
  }
}
