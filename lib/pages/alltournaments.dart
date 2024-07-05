import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/colors/mycolor.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:apna_cricket/pages/jointeampage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTournaments extends StatefulWidget {
  final List<AllContest> contests;
  const AllTournaments({super.key, required this.contests});

  @override
  State<AllTournaments> createState() => _AllTournamentsState();
}

class _AllTournamentsState extends State<AllTournaments> {
    @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => contestListApi(context));

    super.initState();
  }
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
  List matchicons = [
    'assets/cricketlogo.jpg',
    'assets/cricketlogo2.jpg',
    'assets/cricketlogo3.jpg',
    'assets/t20.jpg',
    'assets/test.jpg'
  ];
  Getx getx = Get.put(Getx());

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
            child: ExpansionTile(
              leading: SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
              title: Text(widget.contests[index].contestTypeName.toString()),
              children: [
                 Obx(
                      () => getx.tournamentList.isNotEmpty
                          ? 
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: getx.tournamentList.length,
                  itemBuilder: (context, tournamentIndex) {
                    return Card(
                      elevation: 1,
                      shadowColor: Colors.black12,
                      color: MyColors.sixty,
                      child: ListTile(
                        onTap: () {
                          allmatchListApi(
                            context,
                            getx.tournamentList[tournamentIndex].contestTypeId.toString(),
                            getx.tournamentList[tournamentIndex].userId.toString(),
                            getx.tournamentList[tournamentIndex].tournamentId.toString(),
                          );
                          Get.to(JoinTeam(
                            heading: getx.tournamentList[tournamentIndex].tournamentName,
                          ));
                        },
                        leading: SizedBox(
                          width: 45,
                          height: 45,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              matchicons[tournamentIndex % matchicons.length],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(getx.tournamentList[tournamentIndex].tournamentName),
                      ),
                    );
                  },
                ):Container(),),
              ],
            ),
          );
        },
      ),
    );
  }
}
