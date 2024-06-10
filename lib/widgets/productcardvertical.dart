import 'package:ecommerce/Screens/productdetail.dart';
import 'package:ecommerce/products/FavouriteRepository.dart';
import 'package:ecommerce/products/productmodel.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/widgets/slider.dart'; // Import for RoundedImage
import 'package:flutter/material.dart';
import 'circularcontainer.dart';

// ignore: must_be_immutable
class ProductcardVertical extends StatefulWidget {
  final ProductModel featuredProduct;

  ProductcardVertical(this.featuredProduct, {super.key});

  @override
  State<ProductcardVertical> createState() => _ProductcardVerticalState();
}

class _ProductcardVerticalState extends State<ProductcardVertical> {
  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProductDetail(widget.featuredProduct)));
      },
      child: Container(
          width: 180,
          height: 300,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 50,
                    spreadRadius: 7,
                    offset: const Offset(0, 2))
              ],
              borderRadius: BorderRadius.circular(20),
              color: dark ? ecolor.dark : Colors.white),
          child: Column(
            children: [
              CircularContainer(
                  height: 200,
                  width: 180,
                  radius: 20,
                  padding: ESizes.sm,
                  backgroundcolor: dark
                      ? Color.fromARGB(255, 55, 55, 55)
                      : Color.fromARGB(255, 231, 227, 227),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          RoundedImage(
                            imageurl: widget.featuredProduct.image,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircularContainer(
                          radius: ESizes.sm,
                          height: 20,
                          width: 40,
                          backgroundcolor: Colors.yellow.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              widget.featuredProduct.discount,
                              textAlign: TextAlign.start,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 3,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.featuredProduct.isfav = !widget.featuredProduct.isfav; 
                            });
                            FavouriteRepository.updateproduct(widget.featuredProduct, widget.featuredProduct.isfav);
                          },
                          child: widget.featuredProduct.isfav
                            ? Icon(
                                color: Colors.red,
                                Icons.favorite,
                              )
                            : Icon(Icons.favorite_border),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: ESizes.spaceBtwSections / 3),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    Text(
                      widget.featuredProduct.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: ESizes.spaceBtwSections / 2),
                    Row(children: [
                      Text(
                        widget.featuredProduct.brand!.name, // Use the product brand
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: ESizes.xs),
                      Icon(Icons.verified,
                          color: ecolor.primary, size: ESizes.iconMd)
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\u20B9" +
                              " " +
                              widget.featuredProduct.price, 
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Container(
                          height: ESizes.iconLg * 1.2,
                          width: ESizes.iconLg * 1.2,
                          decoration: BoxDecoration(
                              color: dark ? Colors.white : ecolor.dark,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(ESizes.cardRadiusMd),
                                  bottomRight:
                                      Radius.circular(ESizes.cardRadiusMd))),
                          child: Icon(
                            Icons.add,
                            color: dark ? ecolor.dark : Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
