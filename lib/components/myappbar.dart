import 'package:apna_cricket/colors/mycolor.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String heading;
const MyAppBar({super.key,required this.heading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: MyColors.thirty,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [MyColors.thirty, Colors.black87],
                    transform: const GradientRotation(2))),
          ),
          title: Text(
            heading,
            style: const TextStyle(color: Colors.white),
          ),
        );
  }
}
