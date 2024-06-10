import 'package:flutter/material.dart';

class productcontainer extends StatelessWidget {
  const productcontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 209, 204, 204),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
    );
  }
}
//unused