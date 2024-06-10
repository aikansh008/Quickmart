import 'package:ecommerce/products/Clothesrepository.dart';
import 'package:ecommerce/products/Cosmetics.dart';
import 'package:ecommerce/products/Electronics.dart';
import 'package:ecommerce/products/furniture.dart';
import 'package:ecommerce/products/productmodel.dart';
import 'package:ecommerce/products/productrepository.dart';
import 'package:ecommerce/products/sportsrepository.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/widgets/brands.dart';
import 'package:ecommerce/widgets/productcardvertical.dart';
import 'package:ecommerce/widgets/shopbrandcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import '../common/tabbar.dart';

class ShopScreen extends StatefulWidget {
  ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

RxList<ProductModel> featuredBrands = <ProductModel>[].obs;
RxList<ProductModel> sports = <ProductModel>[].obs;
RxList<ProductModel> Furniture = <ProductModel>[].obs;
RxList<ProductModel> Clothes = <ProductModel>[].obs;
RxList<ProductModel> cosmetics = <ProductModel>[].obs;
RxList<ProductModel> Electronics = <ProductModel>[].obs;

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    super.initState();
    fetchFeaturedProducts();
  }

  void fetchFeaturedProducts() async {
    try {
      final products = await ProductRepository.getFeaturedProducts();
      featuredBrands.addAll(products);
      final productsports = await SportsRepository.getFeaturedProducts();
      sports.addAll(productsports);
      final productfurniture = await FurnitureRepository.getFeaturedProducts();
      Furniture.addAll(productfurniture);
      final productclothes = await ClothesRepository.getFeaturedProducts();
      Clothes.addAll(productclothes);
      final productcosmetics = await CosmeticsRepository.getFeaturedProducts();
      cosmetics.addAll(productcosmetics);
      final productelectronics =
          await ElectronicsRepository.getFeaturedProducts();
      Electronics.addAll(productelectronics);
      print(productsports.length);
    } catch (e) {
      print("Something went wrong: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
        length: featuredBrands.length,
        child: Scaffold(
          appBar: AppBar(
              title: const Text(
                "Store",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 13),
                  child: SizedBox(
                    height: 50,
                    width: 44,
                    child: InkWell(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: dark ? Colors.white : Colors.black,
                            size: 30,
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: dark ? Colors.white : Colors.black,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: dark ? Colors.black : Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
          body: NestedScrollView(
              headerSliverBuilder: (_, innerBoxScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    backgroundColor: dark ? ecolor.dark : ecolor.light,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.all(20),
                      child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            const SizedBox(height: ESizes.spaceBtwItems),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: dark ? Colors.black : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: dark
                                      ? Border.all(color: Colors.white)
                                      : Border.all(color: Colors.black),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        color: dark
                                            ? THelperFunctions.getColor("Grey")
                                            : Colors.grey),
                                    hintText: "Search Products",
                                    prefixIcon: Icon(Icons.search),
                                    contentPadding: EdgeInsets.all(13),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                      color:
                                          dark ? Colors.white : Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(height: ESizes.spaceBtwSections),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Featured Brands",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ESizes.fontSizeLg),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "View All",
                                      style: TextStyle(
                                        color: ecolor.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: ESizes.spaceBtwItems / 1.5,
                            ),
                            GridView.builder(
                                itemCount: 6,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: ESizes.gridViewSpacig,
                                        crossAxisSpacing: ESizes.gridViewSpacig,
                                        mainAxisExtent: 50),
                                itemBuilder: (_, index) =>
                                    BrandsCategory(featuredBrands[index])),
                          ]),
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(48),
                      child: Tabbar(tabs: [
                        Tab(child: Text("Sports")),
                        Tab(child: Text("Furniture")),
                        Tab(child: Text("Clothes")),
                        Tab(child: Text("Cosmetics")),
                        Tab(child: Text("Electronics")),
                      ]),
                    ),
                  )
                ];
              },
              body: TabBarView(children: [
                shopview(sports),
                shopview(Furniture),
                shopview(Clothes),
                shopview(cosmetics),
                shopview(Electronics),
              ])),
        ));
  }
}

// ignore: must_be_immutable
class shopview extends StatelessWidget {
  List<ProductModel> temp;
  shopview(
    this.temp, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                Column(
                  children: [
                    BrandsCategoryCard(
                      brandimage: temp[0].brand!.image,
                      brandtext: temp[0].brand!.name,
                      productimage: temp[0].images[0],
                      productimage2: temp[0].images[1],
                      productimage3:
                          temp[0].images[2],
                      productscount:  temp[0].brand!.productsCount.toString()+" "+"Products",
                    ),
                    BrandsCategoryCard(
                      brandimage:  temp[1].brand!.image,
                      brandtext:  temp[1].brand!.name,
                      productimage: temp[1].images[0],
                      productimage2: temp[1].images[1],
                      productimage3:
                        temp[1].images[2]  ,
                      productscount: temp[1].brand!.productsCount.toString()+" "+"Products",
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "You might like",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      TextButton(onPressed: () {}, child: Text("View All"))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      itemCount: temp.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: ESizes.gridViewSpacig,
                          crossAxisSpacing: ESizes.gridViewSpacig,
                          mainAxisExtent: 314),
                      itemBuilder: (_, index) =>
                          ProductcardVertical(temp[index])),
                )
              ],
            ),
          ]),
    );
  }
}
