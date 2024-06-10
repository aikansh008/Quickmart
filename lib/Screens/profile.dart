import 'package:ecommerce/Screens/Address.dart';
import 'package:ecommerce/Screens/curvededges.dart';
import 'package:ecommerce/Screens/personalinfo.dart';
import 'package:ecommerce/userdata/usermodel.dart';
import 'package:ecommerce/userdata/userrepository.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/widgets/circularcontainer.dart';
import 'package:ecommerce/widgets/listtile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  UserModel? usermodel;
  ProfileScreen({super.key, this.usermodel});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String first = widget.usermodel!.first;
    String last = widget.usermodel!.last;
    String fullname = first + " " + last;
    String? email = widget.usermodel!.email;
    String? userphoto = widget.usermodel!.photo;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 160,
                child: ClipPath(
                    clipper: CurvedEdges(),
                    child: Container(
                        color: ecolor.primary,
                        child: SafeArea(
                            child: Stack(
                          children: [
                            Positioned(
                                top: -100,
                                right: -250,
                                child: CircularContainer(
                                  backgroundcolor: Colors.white,
                                  opacity: 0.1,
                                )),
                            Positioned(
                                top: 100,
                                right: -300,
                                child: CircularContainer(
                                  backgroundcolor: Colors.white,
                                  opacity: 0.1,
                                )),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Account",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(userphoto)),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        fullname,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                        email!,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 60.0, bottom: 20),
                                                    child: InkWell(
                                                      onTap: () async{
                                                        
                          UserModel? userdata =
                              await UserRepository.getUserDetail(email);
                                                        Navigator
                                                            .pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PersonnalInfo(
                                                                    usermodel:
                                                                        userdata,
                                                                  )),
                                                        );
                                                      },
                                                      child: Icon(
                                                          color: Colors.white,
                                                          Icons.edit),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ])
                          ],
                        ))))),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account Settings",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Listtile(
                    icon: Icons.home,
                    title: "My Addresses",
                    subtitle: "Set shopping delivery address",
                    screen: AddressScreen(),
                  ),
                  Listtile(
                      icon: Icons.shopping_cart,
                      title: "My Cart",
                      subtitle: "Add, remove products and move to checkout"),
                  Listtile(
                      icon: Icons.shopping_bag,
                      title: "My Orders",
                      subtitle: "In-progress and completed Order"),
                  Listtile(
                      icon: Icons.account_balance_outlined,
                      title: "Bank Balance",
                      subtitle: "Withdraw balance to registered bank account"),
                  Listtile(
                      icon: Icons.discount,
                      title: "My Coupons",
                      subtitle: "List of all the discounted coupons"),
                  Listtile(
                      icon: Icons.notifications,
                      title: "Notifications",
                      subtitle: "Set any kind of notification message"),
                  Listtile(
                      icon: Icons.lock,
                      title: "Account Privacy",
                      subtitle: "Manage data usage and connected accounts"),
                  SizedBox(
                    height: ESizes.spaceBtwSections,
                  ),
                  Text(
                    "App Settings",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: ESizes.spaceBtwItems,
                  ),
                  Listtile(
                      icon: Icons.upload,
                      title: "Load Data",
                      subtitle: "Upload Data to your Cloud Firebase "),
                  Listtile(
                    icon: Icons.location_on,
                    title: "Geolocation",
                    subtitle: "Set recommendation based on location",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  Listtile(
                    icon: Icons.safety_check,
                    title: "Safe Mode",
                    subtitle: "Search result is safe for all ages",
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  Listtile(
                    icon: Icons.image,
                    title: "HD Image Quality",
                    subtitle: "Set Image quality to be seen",
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
