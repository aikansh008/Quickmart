import 'package:ecommerce/products/productmodel.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/widgets/circularimage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BrandsCategory extends StatelessWidget {
  ProductModel featuredBrand;
   BrandsCategory(
    this.featuredBrand, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Container(
      child: Container(
        decoration: BoxDecoration(
            color: dark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: const Color.fromARGB(255, 201, 197, 197))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularImage(image:featuredBrand.brand!.image),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.verified,
              color: ecolor.primary,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              featuredBrand.brand!.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
