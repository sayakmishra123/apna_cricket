import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:flutter/material.dart';

class AllTournaments extends StatelessWidget {
  final List<AllContest> contests;
  const AllTournaments({super.key, required this.contests});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Tournaments'),
      ),
      body: ListView.builder(
        itemCount: contests.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            trailing: SizedBox(
                width: 20, child: Icon(Icons.arrow_forward_ios_rounded)),
            title: Text(contests[index].contestTypeName),
          );
        },
      ),
    );
  }
}
