import 'package:ecommerce/Screens/Home.dart';
import 'package:ecommerce/Screens/curvededges.dart';
import 'package:ecommerce/Screens/reviews.dart';
import 'package:ecommerce/products/productmodel.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/widgets/Bottomcart.dart';
import 'package:ecommerce/widgets/ColorCircle.dart';
import 'package:ecommerce/widgets/circularimage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/circularcontainer.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel temp;
  const ProductDetail(this.temp, {super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late int temporary;
  @override
  void initState() {
    super.initState();
    temporary = 0;
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar:BottomCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CurvedEdges(),
              child: Container(
                color: Colors.grey.withOpacity(0.5),
                child: SizedBox(
                  height: 440,
                  width: double.infinity,
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Center(
                            child: Image.asset(
                          widget.temp.images[temporary],
                          height: 300,
                          width: 300,
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                      );
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: dark ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  widget.temp.isfav
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                        )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25.0),
                                child: SizedBox(
                                    height: 80,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, index) => Container(
                                            height: 100,
                                            width: 80,
                                            margin: EdgeInsets.only(right: 30),
                                            decoration: BoxDecoration(
                                                color: dark
                                                    ? Color.fromARGB(
                                                            255, 55, 55, 55)
                                                        .withOpacity(0.5)
                                                    : Color.fromARGB(
                                                            255, 55, 55, 55)
                                                        .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  temporary = index;
                                                });
                                              },
                                              child: Image(
                                                image: AssetImage(
                                                    widget.temp.images[index]),
                                              ),
                                            )),
                                        itemCount: widget.temp.images.length)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RatingAndReviews(widget.temp)),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate,
                                color: Colors.amber,
                                size: 24,
                              ),
                              SizedBox(width: ESizes.spaceBtwItems / 3),
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "5  ",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                TextSpan(text: "(199)")
                              ])),
                            ],
                          ),
                        ),
                        Icon(Icons.share),
                      ],
                    ),
                    SizedBox(height: ESizes.spaceBtwSections / 2),
                    Row(
                      children: [
                        CircularContainer(
                          radius: ESizes.sm,
                          height: 20,
                          width: 40,
                          backgroundcolor: Colors.yellow.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              widget.temp.discount,
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ESizes.spaceBtwItems,
                        ),
                        Text(
                          "\u20B9 5999.00",
                          style: TextStyle(
                              fontSize: 15,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          width: ESizes.spaceBtwItems,
                        ),
                        Text(
                          "\u20B9" + " " + widget.temp.price,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: ESizes.spaceBtwSections),
                    Text(widget.temp.title),
                    SizedBox(height: ESizes.spaceBtwSections / 2),
                    Row(
                      children: [
                        Text("Status"),
                        SizedBox(
                          width: ESizes.spaceBtwItems / 2,
                        ),
                        Text(
                          "In Stock",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    SizedBox(height: ESizes.spaceBtwSections),
                    Row(
                      children: [
                        CircularImage(
                            height: 20,
                            width: 20,
                            image: widget.temp.brand!.image),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.temp.brand!.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.verified,
                          color: ecolor.primary,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ESizes.spaceBtwSections,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text("Description",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                          "This is the Description of the Product and it can go up to max 4 lines.",
                          maxLines: 4,
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ],
                )),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Colors",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 215,
                    ),
                    TextButton(onPressed: () {}, child: const Text("View All")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Wrap(
                  children: [
                    ColorCircle(
                      text: "Green",
                      selected: false,
                      onSelected: (value) {},
                    ),
                    ColorCircle(
                      text: "Blue",
                      selected: true,
                      onSelected: (value) {},
                    ),
                    ColorCircle(
                      text: "Yellow",
                      selected: false,
                      onSelected: (value) {},
                    ),
                  ],
                ),
              ),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Text("Size",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      width: 235,
                    ),
                    TextButton(onPressed: () {}, child: const Text("View All")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Wrap(
                  children: [
                    ColorCircle(
                      text: "EU 34",
                      selected: true,
                      onSelected: (value) {},
                    ),
                    ColorCircle(
                      text: "EU 36",
                      selected: false,
                      onSelected: (value) {},
                    ),
                    ColorCircle(
                      text: "EU 38",
                      selected: false,
                      onSelected: (value) {},
                    ),
                  ],
                ),
              ),
            ]),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
                width: THelperFunctions.screenWidth() * 0.4,
                child:
                    ElevatedButton(onPressed: () {}, child: Text('Checkout'))),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
