import 'dart:ui';
import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Getx getx = Get.put(Getx());
  GlobalKey<FormState> gk = GlobalKey<FormState>();

  // Initialize all the controllers
  TextEditingController pincode = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController userMobileNo = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController username = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    pincode.dispose();
    country.dispose();
    state.dispose();
    address.dispose();
    userMobileNo.dispose();
    password.dispose();
    userEmail.dispose();
    username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splash1.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: gk,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Row(
                        children: [
                          Text(
                            'Sign up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            'Please signup to login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Name',
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: TextFormField(
                          controller: userMobileNo,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter mobile no';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Mobile no',
                            prefixIcon: Icon(Icons.phone),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: TextFormField(
                          controller: userEmail,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            } else if (!GetUtils.isEmail(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: TextFormField(
                          controller: country,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your country';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Country',
                            prefixIcon: Icon(Icons.public),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: TextFormField(
                          controller: state,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your state';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'State',
                            prefixIcon: Icon(Icons.flag),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: TextFormField(
                          controller: address,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Address',
                            prefixIcon: Icon(Icons.home),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: TextFormField(
                          controller: pincode,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your pin no';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Pin no',
                            prefixIcon: Icon(Icons.pin_drop),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            controller: password,
                            obscureText: getx.signupvisible.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              hintText: 'Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  getx.signupvisible.value =
                                      !getx.signupvisible.value;
                                },
                                icon: Icon(
                                  getx.signupvisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 238, 237, 237),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: MaterialButton(
                          color: Colors.red,
                          padding: const EdgeInsets.all(10),
                          onPressed: () {
                            if (gk.currentState!.validate()) {
                              gk.currentState!.save();
                              signUpApi(
                                context,
                                username.text,
                                userEmail.text,
                                password.text,
                                userMobileNo.text,
                                address.text,
                                state.text,
                                country.text,
                                pincode.text,
                              );
                            } else {
                              Get.rawSnackbar(
                                  duration: const Duration(seconds: 1),
                                  // backgroundColor: ,
                                  overlayBlur: 5,
                                  barBlur: 5,
                                  title: 'Invalid signup',
                                  message: 'Please enter your details',
                                  snackStyle: SnackStyle.GROUNDED);
                            }
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width - 50,
                              child: const Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  text:
                                      "By registering, I agree to Apna cricket's",
                                  children: [
                                    TextSpan(
                                      text: " Terms & Conditions",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => LoginPage(),
                                transition: Transition.leftToRight);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(
                                  style: TextStyle(color: Colors.white),
                                  text: "Already have an account?",
                                  children: [
                                    TextSpan(
                                      text: " Login",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
