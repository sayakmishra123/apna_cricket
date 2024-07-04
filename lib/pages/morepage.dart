import 'package:apna_cricket/colors/mycolor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
decoration: BoxDecoration(
   color: MyColors.ten,
  borderRadius: BorderRadius.circular(50)),
         
          child: SizedBox(
            height: 80,
            child: LottieBuilder.asset('assets/animate.json')),
        )
      ),
    );
  }
}