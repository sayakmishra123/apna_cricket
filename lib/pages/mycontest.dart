import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                 
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                       boxShadow: [new BoxShadow(
            color: Colors.red.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(10, 10)
          ),]
                    ),
                    height: 300,
                   
                    
                    child: Center(child: Text('data')),
                  ),
                ),
              ],
            )],
          ),
        ),
      )
    );
  }
}