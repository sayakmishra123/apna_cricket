import 'dart:ui';

import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/login/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Getx getx = Get.put(Getx());
  GlobalKey<FormState> gk = GlobalKey();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/splash1.jpg',
                ),
                fit: BoxFit.fill)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Form(
                key: gk,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: Image.asset(
                                'assets/logo.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Login',
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
                          'Please login to continue',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Can't blank";
                          } else {
                            return null;
                          }
                        },
                        controller: username,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Email or mobile no',
                            prefixIcon: Icon(Icons.person),
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Can't blank";
                            } else {
                              return null;
                            }
                          },
                          controller: password,
                          obscureText: getx.loginvisible.value,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  getx.loginvisible.value =
                                      !getx.loginvisible.value;
                                },
                                icon: Icon(
                                  getx.loginvisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 238, 237, 237),
                              border: const OutlineInputBorder(
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
                        onPressed: () {
                          try {
                            if (gk.currentState!.validate()) {
                              loginApi(context, username.text, password.text);
                            } else {
                              Get.rawSnackbar(
                                  duration: Duration(seconds: 1),
                                  // backgroundColor: ,
                                  overlayBlur: 5,
                                  barBlur: 5,
                                  title: 'Invalid login',
                                  message: 'Please enter email or password',
                                  snackStyle: SnackStyle.GROUNDED);
                            }
                          } catch (e) {
                            Get.rawSnackbar(
                                // backgroundColor: ,
                                overlayBlur: 5,
                                barBlur: 5,
                                title: 'Invalid login',
                                message: 'Please enter email or password',
                                snackStyle: SnackStyle.GROUNDED);
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => const SignUpPage(),
                                  transition: Transition.leftToRight);
                            },
                            child: const Text.rich(TextSpan(
                                style: TextStyle(color: Colors.white),
                                text: "Don't have account?",
                                children: [
                                  TextSpan(
                                      text: " Sign Up",
                                      style: TextStyle(color: Colors.red))
                                ])),
                          )
                        ],
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
