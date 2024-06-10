import 'package:ecommerce/Screens/loginscreen.dart';
import 'package:ecommerce/authentication/controllers/signup/signupcontroller.dart';
import 'package:ecommerce/userdata/userrepository.dart';
import 'package:ecommerce/utils/Validators/validators.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool issecure = true;
  bool check = true;

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: dark ? Colors.white : Colors.black,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ),
        body: Form(
          key: SignupController.signup,
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: ESizes.defaultSpace,
              left: ESizes.defaultSpace,
              right: ESizes.defaultSpace,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Let's Create Your Account,",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: ESizes.spaceBtwSections,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: THelperFunctions.screenHeight() * 0.1,
                            width: THelperFunctions.screenWidth() * 0.17,
                            child: TextFormField(
                              controller: SignupController.firstname,
                              validator: (value) =>
                                  Validator.validateText("Firstname", value),
                              style: TextStyle(
                                  fontSize: 17,
                                  color: dark ? Colors.white : Colors.black),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 10),
                                  labelText: "First Name...",
                                  prefixIcon: Icon(Icons.person),
                                  labelStyle: TextStyle(
                                      fontSize: 17,
                                      color: dark
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 53, 50, 50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          width: 1.5, color: ecolor.primary)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        width: 1.5,
                                        color:
                                            dark ? ecolor.light : ecolor.dark),
                                  )),
                            ),
                          ),
                          Container(
                            height: THelperFunctions.screenHeight() * 0.1,
                            width: THelperFunctions.screenWidth() * 0.17,
                            child: TextFormField(
                              controller: SignupController.lastname,
                              validator: (value) =>
                                  Validator.validateText("Lastname", value),
                              style: TextStyle(
                                  fontSize: 17,
                                  color: dark ? Colors.white : Colors.black),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 10),
                                  labelText: "Last Name...",
                                  prefixIcon: Icon(Icons.person),
                                  labelStyle: TextStyle(
                                      fontSize: 17,
                                      color: dark
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 53, 50, 50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          width: 1.5, color: ecolor.primary)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        width: 1.5,
                                        color:
                                            dark ? ecolor.light : ecolor.dark),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: THelperFunctions.screenHeight() * 0.1,
                        width: THelperFunctions.screenWidth() * 0.5,
                        child: TextFormField(
                          controller: SignupController.username,
                          validator: (value) =>
                              Validator.validateText("Username", value),
                          style: TextStyle(
                              fontSize: 17,
                              color: dark ? Colors.white : Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10),
                              labelText: "Username",
                              prefixIcon: Icon(Icons.person_search),
                              labelStyle: TextStyle(
                                  fontSize: 17,
                                  color: dark
                                      ? Colors.white
                                      : const Color.fromARGB(255, 53, 50, 50)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 1.5, color: ecolor.primary)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color: dark ? ecolor.light : ecolor.dark),
                              )),
                        ),
                      ),
                      Container(
                        height: THelperFunctions.screenHeight() * 0.1,
                        width: THelperFunctions.screenWidth() * 0.5,
                        child: TextFormField(
                          controller: SignupController.email,
                          validator: (value) => Validator.validateEmail(value),
                          style: TextStyle(
                              fontSize: 17,
                              color: dark ? Colors.white : Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10),
                              labelText: "E-Mail",
                              prefixIcon: Icon(Icons.email),
                              labelStyle: TextStyle(
                                  fontSize: 17,
                                  color: dark
                                      ? Colors.white
                                      : const Color.fromARGB(255, 53, 50, 50)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 1.5, color: ecolor.primary)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color: dark ? ecolor.light : ecolor.dark),
                              )),
                        ),
                      ),
                      Container(
                        height: THelperFunctions.screenHeight() * 0.1,
                        width: THelperFunctions.screenWidth() * 0.5,
                        child: TextFormField(
                          validator: (value) => Validator.phonenumber(value),
                          controller: SignupController.phonenumber,
                          style: TextStyle(
                              fontSize: 17,
                              color: dark ? Colors.white : Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10),
                              labelText: "Phone Number",
                              prefixIcon: Icon(Icons.phone),
                              labelStyle: TextStyle(
                                  fontSize: 17,
                                  color: dark
                                      ? Colors.white
                                      : const Color.fromARGB(255, 53, 50, 50)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 1.5, color: ecolor.primary)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color: dark ? ecolor.light : ecolor.dark),
                              )),
                        ),
                      ),
                      Container(
                        height: THelperFunctions.screenHeight() * 0.1,
                        width: THelperFunctions.screenWidth() * 0.5,
                        child: TextFormField(
                          obscureText: issecure ? true : false,
                          validator: (value) =>
                              Validator.validatepassword(value),
                          controller: SignupController.password,
                          style: TextStyle(
                              fontSize: 17,
                              color: dark ? Colors.white : Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10),
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      issecure = !issecure;
                                    });
                                  },
                                  child: issecure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility)),
                              labelStyle: TextStyle(
                                  fontSize: 17,
                                  color: dark
                                      ? Colors.white
                                      : const Color.fromARGB(255, 53, 50, 50)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 1.5, color: ecolor.primary)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color: dark ? ecolor.light : ecolor.dark),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: check,
                          onChanged: (value) {
                            setState(() {
                              check = !check;
                            });
                          },
                        ),
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "I agree to ",
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: "Privacy Policy ",
                            style: TextStyle(
                              color: ecolor.primary,
                              fontSize: ESizes.md,
                            )),
                        TextSpan(
                            text: "and ",
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: "Terms of Use",
                            style: TextStyle(
                              color: ecolor.primary,
                              fontSize: ESizes.md,
                            )),
                      ]))
                    ],
                  ),
                  SizedBox(
                    height: ESizes.spaceBtwSections,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                ecolor.primary, // Set the background color here
                          ),
                          onPressed: () async{
                            
                            if (Validator.checkbox(check) == false) {

                            } else if (SignupController.signup.currentState!
                                    .validate() &&
                                Validator.checkbox(check)) {
                              SignupController.signUpcall(
                              
                                  SignupController.email.text,
                                  SignupController.password.text,
                                  context);
                              UserRepository.createUser(SignupController.user,context);
                            }
                          },
                          child: Text("Create Account"))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(100)),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 120.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            SignupController.signInGoogle(context);
                          },
                          child: Image.asset(
                            'assets/Icons/icons8-google-48.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/Icons/icons8-facebook-48.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
