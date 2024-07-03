import 'dart:ui';

import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Getx getx = Get.put(Getx());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/splash.jpg',
                  ),
                  fit: BoxFit.fill)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Image.asset(
                              'assets/logo.png',
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        Text(
                          'Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'Please signup to login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Name',
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Mobile no',
                            prefixIcon: Icon(Icons.phone),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Country',
                            prefixIcon: Icon(Icons.public),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'State',
                            // labelText: 'State',
                            prefixIcon: Icon(Icons.flag),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Address',
                            prefixIcon: Icon(Icons.home),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Pin no',
                            prefixIcon: Icon(Icons.pin_drop),
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: TextFormField(
                          obscureText: getx.signupvisible.value,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
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
                              fillColor: Color.fromARGB(255, 238, 237, 237),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: MaterialButton(
                        color: Colors.red,
                        padding: const EdgeInsets.all(10),
                        // shape: ContinuousRectangleBorder(
                        //     borderRadius: BorderRadius.circular(80)),
                        onPressed: () {},
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => LoginPage(),
                              transition: Transition.leftToRight);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(TextSpan(
                                style: TextStyle(color: Colors.white),
                                text: "Already have account?",
                                children: [
                                  TextSpan(
                                      text: " Login",
                                      style: TextStyle(color: Colors.red))
                                ]))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
