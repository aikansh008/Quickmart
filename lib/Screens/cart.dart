import 'package:ecommerce/Screens/Home.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child:
              Icon(color: dark ? Colors.white : Colors.black, Icons.arrow_back),
        ),
        title: Text("Cart"),
      ),
      body: ListView.separated(
          itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                color: dark ? Colors.black : Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Image(
                              image:
                                  AssetImage("assets/products/NikeAirMax.png"),
                            )),
                        SizedBox(
                          width: ESizes.spaceBtwItems,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Nike",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.verified,
                                  color: ecolor.primary,
                                ),
                              ],
                            ),
                            Text("Black Sports Shoes",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "Color ",
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: "Black ",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(
                                  text: "Size ",
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: "8 UK ",
                                  style: Theme.of(context).textTheme.bodyLarge)
                            ])),
                            SizedBox(
                              height: ESizes.spaceBtwItems,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: dark
                                        ? Colors.white
                                        : Color.fromARGB(255, 220, 215, 215),
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  )),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: ecolor.primary,
                                  ),
                                  child: Center(
                                      child: Text(
                                    "2",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: dark
                                        ? Colors.white
                                        : Color.fromARGB(255, 220, 215, 215),
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  )),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text("\u20B9 3499",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
          separatorBuilder: (_, __) => SizedBox(
                height: ESizes.spaceBtwSections,
              ),
          itemCount: 10),
      bottomNavigationBar: ElevatedButton(
          clipBehavior: Clip.none,
          style: ElevatedButton.styleFrom(
            backgroundColor: ecolor.primary,
          ),
          onPressed: () {},
          child: const Text("Checkout \u20B9 34990")),
    );
  }
}
