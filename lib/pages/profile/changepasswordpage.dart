import 'dart:ui';
import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:flutter/material.dart';
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
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  User? userid;

  getuser() async {
    User? userid = await UserPreferences().getUser();
  }


  @override
  void initState() {
   getuser();
    super.initState();
  }

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
                    const SizedBox(
                      height: 70,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Change Password',
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
                          'Please enter your previous password',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
                          controller: oldPassword,
                          obscureText: getx.oldPasswordvisible.value,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              hintText: 'Old Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  getx.oldPasswordvisible.value =
                                      !getx.oldPasswordvisible.value;
                                },
                                icon: Icon(
                                  getx.oldPasswordvisible.value
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Can't blank";
                            } else {
                              return null;
                            }
                          },
                          controller: newpassword,
                          obscureText: getx.newpasswordvisible.value,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              hintText: 'New Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  getx.newpasswordvisible.value =
                                      !getx.newpasswordvisible.value;
                                },
                                icon: Icon(
                                  getx.newpasswordvisible.value
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Can't blank";
                            } else if (value != newpassword.text) {
                              return "Password dose't match";
                            } else {
                              return null;
                            }
                          },
                          controller: confirmpassword,
                          obscureText: getx.confirmnewPasswordvisible.value,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              hintText: 'Confirm New Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  getx.confirmnewPasswordvisible.value =
                                      !getx.confirmnewPasswordvisible.value;
                                },
                                icon: Icon(
                                  getx.confirmnewPasswordvisible.value
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
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: MaterialButton(
                        color: Colors.red,
                        padding: const EdgeInsets.all(10),
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPressed: () {
                          try {
                            if (!gk.currentState!.validate()) {
                              changepasswordApi(
                                  context,
                                  userid!.userId.toString(),
                                  confirmpassword.text.toString());
                            } else {
                              Get.rawSnackbar(
                                  duration: Duration(seconds: 1),
                                  // backgroundColor: ,
                                  overlayBlur: 5,
                                  barBlur: 5,
                                  title: 'Invalid login',
                                  message: 'Please enter password',
                                  snackStyle: SnackStyle.GROUNDED);
                            }
                          } catch (e) {
                            Get.rawSnackbar(
                                // backgroundColor: ,
                                overlayBlur: 5,
                                barBlur: 5,
                                title: 'Invalid login',
                                message: 'Please enter password',
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
    );
  }
}
