import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/widgets/circularimage.dart';
import 'package:flutter/material.dart';

class BrandsCategoryCard extends StatelessWidget {
  const BrandsCategoryCard({
    super.key, required this.brandimage, required this.brandtext, required this.productimage, required this.productimage2, required this.productimage3, required this.productscount,
  });
  final String brandimage;
  final String brandtext;
  final String productimage;
    final String productimage2;
    final String productimage3;
    final String productscount;
  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Container(
          decoration: BoxDecoration(
              color: dark ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: const Color.fromARGB(255, 201, 197, 197))),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          CircularImage(image: brandimage)),
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
                   brandtext,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
           SizedBox(height: 10,),
              Text(productscount,style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
              textAlign: TextAlign.start,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: ESizes.md),
                        height: 100,
                        color: dark
                            ? const Color.fromARGB(255, 63, 62, 62)
                            : Colors.white,
                        child: Image(
                            image:
                                AssetImage(productimage)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: ESizes.md),
                        height: 100,
                        color: dark
                            ? const Color.fromARGB(255, 63, 62, 62)
                            : Colors.white,
                        child: Image(
                            image:
                                AssetImage(productimage2)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: ESizes.md),
                        height: 100,
                        color: dark
                            ? const Color.fromARGB(255, 63, 62, 62)
                            : Colors.white,
                        child: Image(
                            image:
                                AssetImage(productimage3)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
