import 'package:ecommerce/Categories/Categoryrepository.dart';
import 'package:ecommerce/Categories/categorymodel.dart';
import 'package:ecommerce/Screens/cart.dart';
import 'package:ecommerce/Screens/curvededges.dart';
import 'package:ecommerce/products/productmodel.dart';
import 'package:ecommerce/products/productrepository.dart';
import 'package:ecommerce/userdata/usermodel.dart';
import 'package:ecommerce/userdata/userrepository.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/widgets/productcardvertical.dart';
import 'package:ecommerce/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/circularcontainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/get_rx.dart';
import '../utils/constants/sizes.dart';

class HomeScreen extends StatefulWidget {
  final UserModel? usermodel;
  const HomeScreen({super.key, this.usermodel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
RxList<CategoryModel> featuredCategory = <CategoryModel>[].obs;

class _HomeScreenState extends State<HomeScreen> {
  int x = 0;
  final List<Widget> banner = const [
    RoundedImage(
        imageurl: "assets/products/promo-banner-2.png",
        borderRadius: ESizes.md,
        fit: BoxFit.cover),
    RoundedImage(
        imageurl:"assets/products/promo-banner-1.png",
        borderRadius: ESizes.md,
        fit: BoxFit.cover),
    RoundedImage(
      imageurl: "assets/products/promo-banner-3.png",
    )
  ];

  @override
  void initState() {
     fetchFeaturedProducts();
    super.initState();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      final products = await ProductRepository.getFeaturedProducts();
      featuredProducts.addAll(products);
      final category = await CategoryRepository.getAllCategories();
      featuredCategory.addAll(category);
      
          } 
          catch (e) {
      print("Something went wrong: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<UserModel?>(
          future: UserRepository.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Center(child: Text("No user data available"));
            }

            UserModel userdata = snapshot.data!;
            String fullName = "${userdata.first} ${userdata.last}";

            return Column(
              children: [
                _buildHeader(context, fullName, dark),
                _buildBannerSlider(),
                const SizedBox(height: ESizes.spaceBtwSections),
                _buildFeaturedProductsGrid(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String fullName, bool dark) {
    return ClipPath(
      clipper: CurvedEdges(),
      child: Container(
        color: ecolor.primary,
        child: SizedBox(
          height: 400,
          width: double.infinity,
          child: SafeArea(
            child: Stack(
              children: [
                const Positioned(
                  top: -100,
                  right: -250,
                  child: CircularContainer(
                    backgroundcolor: Colors.white,
                    opacity: 0.1,
                  ),
                ),
                const Positioned(
                  top: 100,
                  right: -300,
                  child: CircularContainer(
                    backgroundcolor: Colors.white,
                    opacity: 0.1,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderTopRow(context, fullName),
                    _buildSearchBar(dark),
                    _buildPopularCategories(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderTopRow(BuildContext context, String fullName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Good day for shopping",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                fullName,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 18.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            child: SizedBox(
              height: 50,
              width: 44,
              child: Stack(
                children: [
                  const Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                    size: 30,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "2",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSearchBar(bool dark) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: dark ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintStyle: TextStyle(color: dark ? Colors.grey : Colors.grey),
            hintText: "Search Products",
            prefixIcon: const Icon(Icons.search),
            contentPadding: const EdgeInsets.all(13),
            border: InputBorder.none,
          ),
          style: TextStyle(color: dark ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _buildPopularCategories() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      
      child: Column(
        children: [
          Text(
            "Popular Categories",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 98,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: featuredCategory.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Column(
                    children: [
                     CircleAvatar(backgroundImage: AssetImage(featuredCategory[index].image),
                     radius: 30,
                     
                     ),
                      SizedBox(
                        width: 55,
                        child: Text(
                         featuredCategory[index].name,
                          style: TextStyle(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerSlider() {
    return Padding(
      padding: const EdgeInsets.all(ESizes.defaultSpace),
      child: Column(
        children: [
          CarouselSlider(
            items: banner,
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) {
                setState(() {
                  x = index;
                });
              },
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(height: ESizes.spaceBtwItems),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < banner.length; i++)
                CircularContainer(
                  margin: const EdgeInsets.only(right: 10),
                  height: 4,
                  width: 10,
                  radius: 10,
                  backgroundcolor: x == i
                      ? ecolor.primary
                      : const Color.fromARGB(255, 128, 124, 124),
                  opacity: 1,
                )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedProductsGrid() {
    return Padding(
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
        itemBuilder: (_, index) => ProductcardVertical(featuredProducts[index]),
      ),
    );
  }
}
