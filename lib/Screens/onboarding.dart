import 'package:flutter/material.dart';
import 'package:ecommerce/Screens/loginscreen.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/utils/constants/sizes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              OnboardingPage(
                image:
                    "assets/Images/sammy-line-sailor-on-mast-looking-through-telescope.gif",
                title: "Choose your product",
                subtitle:
                    "Welcome to a World of Limitless Choices - Your Perfect Product Awaits!",
              ),
              OnboardingPage2(
                image:
                    "assets/Images/sammy-line-woman-in-shopping-cart-placing-order-on-smartphone.gif",
                title: "Select Payment Method",
                subtitle:
                    "For Seamless Transactions. Choose Your Payment Path - Your Convenience, Our Priority!",
              ),
              OnboardingPage3(
                image:
                    "assets/Images/sammy-line-man-and-dog-delivering-packages-on-a-moped.gif",
                title: "Delivery at your doorstep",
                subtitle:
                    "From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(ESizes.defaultSpace),
            child: Column(
              children: [
                Image.asset(
                  image,
                  width: THelperFunctions.screenWidth() * 0.8,
                  height: THelperFunctions.screenHeight() * 0.6,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: ESizes.spaceBtwItems),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: kBottomNavigationBarHeight,
            right: ESizes.defaultSpace,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnboardingPage2(
                        image:
                            "assets/Images/sammy-line-woman-in-shopping-cart-placing-order-on-smartphone.gif",
                        title: "Select Payment Method",
                        subtitle:
                            "For Seamless Transactions. Choose Your Payment Path - Your Convenience, Our Priority!",
                      ),
                    )
                    );
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? THelperFunctions.getColor('Blue')
                    : THelperFunctions.getColor('Black'),
              ),
              child: const Icon(Icons.keyboard_arrow_right_sharp),
            ),
          ),
          Positioned(
            top: kToolbarHeight,
            right: ESizes.defaultSpace,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: Text('Skip'),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(ESizes.defaultSpace),
            child: Column(
              children: [
                Image.asset(
                  image,
                  width: THelperFunctions.screenWidth() * 0.8,
                  height: THelperFunctions.screenHeight() * 0.6,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: ESizes.spaceBtwItems),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: kBottomNavigationBarHeight,
            right: ESizes.defaultSpace,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnboardingPage3(
                        image:
                            "assets/Images/sammy-line-man-and-dog-delivering-packages-on-a-moped.gif",
                        title: "Delivery at your doorstep",
                        subtitle:
                            "From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!",
                      ),
                    ));
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? THelperFunctions.getColor('Blue')
                    : THelperFunctions.getColor('Black'),
              ),
              child: const Icon(Icons.keyboard_arrow_right_sharp),
            ),
          ),
          Positioned(
            top: kToolbarHeight,
            right: ESizes.defaultSpace,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: Text('Skip'),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(ESizes.defaultSpace),
            child: Column(
              children: [
                Image.asset(
                  image,
                  width: THelperFunctions.screenWidth() * 0.8,
                  height: THelperFunctions.screenHeight() * 0.6,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: ESizes.spaceBtwItems),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: kBottomNavigationBarHeight,
            right: ESizes.defaultSpace,
            child: ElevatedButton(
              onPressed: () {
                LoginScreen();
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? THelperFunctions.getColor('Blue')
                    : THelperFunctions.getColor('Black'),
              ),
              child: const Icon(Icons.keyboard_arrow_right_sharp),
            ),
          ),
          Positioned(
            top: kToolbarHeight,
            right: ESizes.defaultSpace,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: Text('Skip'),
            ),
          ),
        ],
      ),
    );
  }
}
