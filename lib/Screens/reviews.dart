import 'package:ecommerce/Screens/UserReviewCard.dart';
import 'package:ecommerce/Screens/productdetail.dart';
import 'package:ecommerce/products/productmodel.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class RatingAndReviews extends StatelessWidget {
  ProductModel temp;
   RatingAndReviews(this .temp, {super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => ProductDetail(temp)),
              );
            },
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => RatingAndReviews(temp)),
                  );
                },
                child: Icon(
                  Icons.arrow_back,
                  color: dark ? Colors.white : Colors.black,
                )),
          ),
          centerTitle: true,
          title: Text(
            "Reviews and Ratings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Ratings and Reviews  are verified and are from people who use the same type of device that you use"),
                SizedBox(
                  height: ESizes.spaceBtwSections / 2,
                ),
                Row(
                  children: [
                    Text("4.8",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        ProgressIndicator(
                          val: 0.5,
                          rating: "5",
                        ),
                        ProgressIndicator(
                          val: 0.4,
                          rating: "4",
                        ),
                        ProgressIndicator(
                          val: 0.3,
                          rating: "3",
                        ),
                        ProgressIndicator(
                          val: 0.2,
                          rating: "2",
                        ),
                        ProgressIndicator(
                          val: 0.1,
                          rating: "1",
                        ),
                      ],
                    )
                  ],
                ),
                RatingBarIndicator(
                    rating: 4.5,
                    itemSize: 20,
                    itemBuilder: (_, __) => Icon(
                          Icons.star,
                          color: ecolor.primary,
                        )),
                SizedBox(height: ESizes.spaceBtwItems / 2),
                Text(
                  "12,681",
                  style: TextStyle(color: Colors.grey[800]),
                ),
                SizedBox(height: ESizes.spaceBtwItems),
                ProductReview(),
                SizedBox(height: ESizes.spaceBtwItems),
                ProductReview()
              ],
            ),
          ),
        ));
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    super.key,
    required this.rating,
    required this.val,
  });
  final String rating;
  final double val;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(children: [
        Text(
          rating,
          style: TextStyle(
            fontSize: 10,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: THelperFunctions.screenWidth() * 0.3,
          child: LinearProgressIndicator(
            value: val,
            minHeight: 15,
            backgroundColor: const Color.fromARGB(255, 105, 103, 103),
            valueColor: AlwaysStoppedAnimation(ecolor.primary),
            borderRadius: BorderRadius.circular(8),
          ),
        )
      ]),
    );
  }
}
