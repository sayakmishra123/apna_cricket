import 'package:apna_cricket/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      Get.to(() => const LoginPage(), transition: Transition.leftToRight);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Image.asset(
            'assets/splash.jpg',
            fit: BoxFit.fitHeight,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Apna Cricket',
                style: TextStyle(color: Colors.white),
                textScaler: TextScaler.linear(2),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
