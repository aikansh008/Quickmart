import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/Images/user.png"),
                ),
                SizedBox(width: ESizes.spaceBtwItems),
                Text(
                  "Aikansh Tiwari",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(
          height: ESizes.spaceBtwSections / 2,
        ),
        Row(
          children: [
            RatingBarIndicator(
                rating: 4.5,
                itemSize: 12,
                itemBuilder: (_, __) => Icon(
                      Icons.star,
                      color: ecolor.primary,
                    )),
            SizedBox(
              width: ESizes.spaceBtwSections / 5,
            ),
            Text(
              "01 Jan 2024",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        SizedBox(
          height: ESizes.spaceBtwItems,
        ),
        Text(
            "The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great Job!"),
        SizedBox(
          height: ESizes.spaceBtwSections,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("T store ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("02 Jan 2024",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: ESizes.spaceBtwItems / 2,
                ),
                Text(
                  "The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great Job!",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: THelperFunctions.isDarkMode(context)
                  ? Colors.grey[800]
                  : Color.fromARGB(255, 230, 227, 227),
              borderRadius: BorderRadius.circular(10)),
        )
      ],
    );
  }
}
