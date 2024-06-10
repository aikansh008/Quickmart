
// import 'package:ecommerce/utils/constants/colors.dart';
// import 'package:ecommerce/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';

// import '../../widgets/animationloader.dart';

// class fullscreenloader {
//   static void openloadingDialog(
//       String text, String animation, BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (_) => PopScope(
//             canPop: false,
//             child: Container(
//               color: THelperFunctions.isDarkMode(context)
//                   ? ecolor.dark
//                   : ecolor.white,
//               width: double.infinity,
//               height: double.infinity,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 300),
//                   AnimationLoader(animation: animation, text: text)
//                 ],
//               ),
//             )));
//   }

//   static stoploading(BuildContext context) {
//     Navigator.of(context).pop();
//   }
// }
