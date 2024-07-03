import 'package:flutter/material.dart';

class MyContest extends StatefulWidget {
  const MyContest({super.key});

  @override
  State<MyContest> createState() => _MyContestState();
}

class _MyContestState extends State<MyContest> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
backgroundColor: Colors.red[50],

      body: Center(
        child: Text('MyContest'),
      ),
    );
  }
}