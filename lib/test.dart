import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllContest {
  final String contestTypeId;
  final String userId;
  final String tournamentId;
  final String contestTypeName;
  final String tournamentName;

  AllContest({
    required this.contestTypeId,
    required this.userId,
    required this.tournamentId,
    required this.contestTypeName,
    required this.tournamentName,
  });
}

void main() {
  runApp(GetMaterialApp(
    home: ContestsPage(),
  ));
}

class ContestsPage extends StatelessWidget {
  final List<AllContest> currentContests = [
    AllContest(
      contestTypeId: '1',
      userId: 'user1',
      tournamentId: 't1',
      contestTypeName: 'Current Contest 1',
      tournamentName: 'Tournament 1',
    ),
    AllContest(
      contestTypeId: '2',
      userId: 'user2',
      tournamentId: 't2',
      contestTypeName: 'Current Contest 2',
      tournamentName: 'Tournament 2',
    ),
  ];

  final List<AllContest> contestHistory = [
    AllContest(
      contestTypeId: '3',
      userId: 'user3',
      tournamentId: 't3',
      contestTypeName: 'Past Contest 1',
      tournamentName: 'Tournament 3',
    ),
    AllContest(
      contestTypeId: '4',
      userId: 'user4',
      tournamentId: 't4',
      contestTypeName: 'Past Contest 2',
      tournamentName: 'Tournament 4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          
          title: const Text('Contests'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Current Contests'),
              Tab(text: 'Contest History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ContestsList(contests: currentContests),
            ContestsList(contests: contestHistory),
          ],
        ),
      ),
    );
  }
}

class ContestsList extends StatelessWidget {
  final List<AllContest> contests;

  const ContestsList({super.key, required this.contests});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contests.length,
      itemBuilder: (context, index) {
        return ContestCard(
          contest: contests[index],
          onTap: () {
            // Handle contest tap
            Get.to(JoinTeam(
              heading: contests[index].contestTypeName,
            ));
          },
        );
      },
    );
  }
}

class ContestCard extends StatelessWidget {
  final AllContest contest;
  final VoidCallback onTap;

  const ContestCard({super.key, required this.contest, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black12,
      child: ListTile(
        onTap: onTap,
        leading: SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/cricketlogo.jpg', // Replace with appropriate image
              fit: BoxFit.cover,
            ),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 15,
        ),
        title: Text(contest.contestTypeName),
      ),
    );
  }
}

class JoinTeam extends StatelessWidget {
  final String heading;

  const JoinTeam({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(heading),
      ),
      body: Center(
        child: Text('Join Team Page for $heading'),
      ),
    );
  }
}
