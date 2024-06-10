import 'package:ecommerce/products/FavouriteRepository.dart';
import 'package:ecommerce/products/productmodel.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants/sizes.dart';
import '../widgets/productcardvertical.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void initState() {
    super.initState();
    fetchFeaturedProducts();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      final products = await FavouriteRepository.getFeaturedProducts();
      featuredProducts.assignAll(products);
    } catch (e) {
      print("Something went wrong: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wishlist",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add, color: dark ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Obx(() => RefreshIndicator(
          onRefresh: fetchFeaturedProducts,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: featuredProducts.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: ESizes.gridViewSpacig,
                      crossAxisSpacing: ESizes.gridViewSpacig,
                      mainAxisExtent: 314,
                    ),
                    itemBuilder: (_, index) =>
                        ProductcardVertical(featuredProducts[index]),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
