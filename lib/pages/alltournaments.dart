import 'package:flutter/material.dart';

class AllTournaments extends StatefulWidget {
  final List contests;
  const AllTournaments({super.key, required this.contests});

  @override
  State<AllTournaments> createState() => _AllTournamentsState();
}

class _AllTournamentsState extends State<AllTournaments> {
  List images = [
    'assets/match1.jpg',
    'assets/match2.jpg',
    'assets/match3.jpg',
     'assets/cricketlogo.jpg',
    'assets/cricketlogo2.jpg',
    'assets/cricketlogo3.jpg',
    'assets/t20.jpg',
    'assets/test.jpg',
    'assets/match1.jpg',
    'assets/match2.jpg',
    'assets/match3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Tournaments'),
      ),
      body: ListView.builder(
        itemCount: widget.contests.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            shadowColor: Colors.black12,
            child: ListTile(
              leading: SizedBox(
                height: 40,
                width: 40,

                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(images[index],fit: BoxFit.cover,)),
              ),
              onTap: () {},
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
              title: Text(widget.contests[index]),
            ),
          );
        },
      ),
    );
  }
}
