import 'package:apna_cricket/colors/mycolor.dart';
import 'package:flutter/material.dart';

class MilesBalance extends StatelessWidget {
  const MilesBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: MyColors.appbargradient),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Miles Balance',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        actions: [
          Text(
            'Contest Entry: 49 miles',
            style: TextStyle(fontSize: 10, color: Colors.white),
          )
        ],
      ),
      body: Container(),
    );
  }
}
