import 'dart:ui';
import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  Getx getx = Get.put(Getx());
  GlobalKey<FormState> gk = GlobalKey();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  User? userId;

  getUser() async {
    userId = await UserPreferences().getUser();
    setState(() {});
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/splash.jpg'), fit: BoxFit.fill)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.transparent,
                  Colors.black87,
                  Colors.black87,
                ])),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: gk,
                  child: Column(
                    children: [
                      // const SizedBox(height: 70),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       ClipRRect(
                      //         borderRadius: BorderRadius.circular(200),
                      //         child: SizedBox(
                      //           width: 200,
                      //           height: 200,
                      //           child: Image.asset('assets/logo.jpg',
                      //               fit: BoxFit.contain),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                          height: 40,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Image(
                                color: Colors.red[500],
                                image: AssetImage('assets/shield.png')),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Change Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                                shadows: [
                                  Shadow(blurRadius: 100, color: Colors.white)
                                ]),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              'Avoid using easily guessable words or sequences. Your new password will enhance the security of your account.',
                              style: TextStyle(

                                  // fontWeight: FontWeight.w200,
                                  fontSize: 15,
                                  color: Colors.white38),
                            ),
                          )
                        ],
                      ),

                      SizedBox(
                        height: height * 0.2,
                      ),

                      const Row(
                        children: [
                          Text(
                            'Please enter your previous password',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white70),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Old password cannot be blank";
                              } else {
                                return null;
                              }
                            },
                            controller: oldPassword,
                            obscureText: getx.oldPasswordVisible.value,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                hintText: 'Old Password',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    getx.oldPasswordVisible.value =
                                        !getx.oldPasswordVisible.value;
                                  },
                                  icon: Icon(
                                    getx.oldPasswordVisible.value
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
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "New password cannot be blank";
                              } else if (value.length < 6) {
                                return "Password should be at least 6 characters";
                              } else {
                                return null;
                              }
                            },
                            controller: newPassword,
                            obscureText: getx.newPasswordVisible.value,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                hintText: 'New Password',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    getx.newPasswordVisible.value =
                                        !getx.newPasswordVisible.value;
                                  },
                                  icon: Icon(
                                    getx.newPasswordVisible.value
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
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Confirm password cannot be blank";
                              } else if (value != newPassword.text) {
                                return "Passwords do not match";
                              } else {
                                return null;
                              }
                            },
                            controller: confirmPassword,
                            obscureText: getx.confirmNewPasswordVisible.value,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                hintText: 'Confirm New Password',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    getx.confirmNewPasswordVisible.value =
                                        !getx.confirmNewPasswordVisible.value;
                                  },
                                  icon: Icon(
                                    getx.confirmNewPasswordVisible.value
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
                      const SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: MaterialButton(
                          color: Colors.red,
                          padding: const EdgeInsets.all(10),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            if (gk.currentState!.validate()) {
                              if (userId != null) {
                                changepasswordApi(
                                    context,
                                    userId!.userId.toString(),
                                    confirmPassword.text);
                              } else {
                                Get.rawSnackbar(
                                    duration: const Duration(seconds: 1),
                                    overlayBlur: 5,
                                    barBlur: 5,
                                    title: 'User not found',
                                    message: 'Please log in again',
                                    snackStyle: SnackStyle.GROUNDED);
                              }
                            } else {
                              Get.rawSnackbar(
                                  duration: const Duration(seconds: 1),
                                  overlayBlur: 5,
                                  barBlur: 5,
                                  title: 'Invalid Input',
                                  message: 'Please correct the errors',
                                  snackStyle: SnackStyle.GROUNDED);
                            }
                          },
                          child: const Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
