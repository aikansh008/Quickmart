import 'dart:typed_data';

import 'package:ecommerce/Screens/profile.dart';
import 'package:ecommerce/Screens/updateinformationfirst.dart';
import 'package:ecommerce/Screens/updateuserinformationsingle.dart';
import 'package:ecommerce/userdata/Imagepicker.dart';
import 'package:ecommerce/userdata/usermodel.dart';
import 'package:ecommerce/userdata/userrepository.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class PersonnalInfo extends StatefulWidget {
  UserModel? usermodel;
  PersonnalInfo({super.key, this.usermodel});

  @override
  State<PersonnalInfo> createState() => _PersonnalInfoState();
}

class _PersonnalInfoState extends State<PersonnalInfo> {
  Uint8List? _image;

  void selectImage() async {
    _image =
        (await ImagePickers.pickImage(ImageSource.gallery, widget.usermodel!))
            as Uint8List?;

    setState(() {});
  }

  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    String first = widget.usermodel!.first;
    String last = widget.usermodel!.last;
    String fullname = first + " " + last;
    String? email = widget.usermodel!.email;
    String? username = widget.usermodel!.id;
    String? phone = widget.usermodel!.phone;
    String? phonenumber = "+91-" + phone!;
    String? userid = widget.usermodel!.id;
    String? userphoto = widget.usermodel!.photo;
    String? mail = widget.usermodel!.email;

    return Scaffold(
        appBar: AppBar(
          leading: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                            usermodel: widget.usermodel!,
                          )),
                );
              },
              child: Icon(
                  color: dark ? Colors.white : Colors.black, Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 40,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(userphoto)),
                    TextButton(
                        onPressed: () async {
                          selectImage();

                          UserModel? userdata =
                              await UserRepository.getUserDetail(mail!);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                      usermodel:userdata!,
                                    )),
                          );
                        },
                        child: const Text(
                          "Change Profile Picture",
                          style: TextStyle(fontSize: 15),
                        )),
                    Divider(
                      color: dark
                          ? const Color.fromARGB(255, 69, 76, 72)
                          : Colors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 5,
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwSections,
                    ),
                    const Text(
                      "Profile Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: ESizes.spaceBtwSections),
                    profileinfoDetail(
                        input: "Name",
                        answer: fullname,
                        temp: UpdateuserData(
                          usermodel: widget.usermodel,
                          fieldfirst: 'First',
                          fieldlast: 'Last',
                        )),
                    profileinfoDetail(
                        input: "Username",
                        answer: userid!,
                        temp: updatesinglefield(
                            text: "Username",
                            usermodel: widget.usermodel!,
                            field: username)),
                    Divider(
                      color: dark
                          ? const Color.fromARGB(255, 69, 76, 72)
                          : Colors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 5,
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwSections / 2,
                    ),
                    const Text(
                      "Personal Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwSections / 2,
                    ),
                    profileinfoDetail(
                        input: "User ID",
                        answer: userid,
                        temp: updatesinglefield(
                            usermodel: widget.usermodel!,
                            field: widget.usermodel!.id)),
                    profileinfoDetail(
                      input: "E-mail",
                      answer: email!,
                    ),
                    profileinfoDetail(
                      input: "Phone Number",
                      answer: phonenumber,
                      ai: 4,
                      bi: 4,
                      temp: updatesinglefield(
                          usermodel: widget.usermodel!, field: "Phone"),
                    ),
                    const profileinfoDetail(input: "Gender", answer: "Male"),
                    const profileinfoDetail(
                        input: "Date Of Birth", answer: "13-Sep-2003"),
                  ],
                ),
              ),
              SizedBox(height: ESizes.spaceBtwSections),
              Container(
                width: THelperFunctions.screenWidth() * 0.3,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      UserRepository.deleteuserRecord(
                          widget.usermodel!, context);
                    },
                    child: const Text("Close Account")),
              )
            ],
          ),
        ));
  }
}

class profileinfoDetail extends StatelessWidget {
  const profileinfoDetail({
    super.key,
    required this.input,
    required this.answer,
    this.temp,
    this.ai = 3,
    this.bi = 5,
  });
  final String input, answer;
  final int ai, bi;
  final Widget? temp;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => temp!));
      },
      child: Padding(
        padding: const EdgeInsets.all(ESizes.spaceBtwItems / 1.5),
        child: Row(children: [
          Expanded(
              flex: ai,
              child: Text(
                input,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              )),
          Expanded(
              flex: bi,
              child: Text(
                answer,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              )),
          const Expanded(child: Icon(Icons.arrow_forward_ios))
        ]),
      ),
    );
  }
}
