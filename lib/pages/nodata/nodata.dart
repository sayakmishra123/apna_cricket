import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120
      ,
      child: Image.asset('assets/nodata1.png'));
  }
}