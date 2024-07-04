import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/colors/mycolor.dart';
import 'package:apna_cricket/pages/alltournaments.dart';
import 'package:apna_cricket/pages/jointeampage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var heading = const TextStyle(fontSize: 16);
  Getx getx = Get.put(Getx());
  int _selectedIndex = 0;
  List contests = [
    "All Match Contest",
    "Single Match Contest",
    "double Match Contest",
    "All Match Contest",
    "Single Match Contest",
    "double Match Contest",
    "All Match Contest",
    "Single Match Contest",
    "double Match Contest",
    "double Match Contest",
  ];
  List matches = [
    [
      'T20',
      'TEST MATCH',
      'WTC20',
      'T20',
    ],
    ['TEST MATCH', 'WTC20', 'SDG', 'TEST MATCH', 'abc20'],
    ['SDGSDFGDG', 'DrFG', 'SDgFG', 'SDggFGH', 'YHgaIKT'],
    ['frthrthawerF', 'SaergG', 'SADG', 'SDG', 'SG'],
    ['sfsf', 'SAFG', 'SADG', 'SDgwG', 'SgawgG'],
    ['sf', 'SAFG', 'SAergDG', 'SDgG', 'SgG'],
    ['sdf', 'SAFG', 'SArgDG', 'SDgG', 'SggG'],
    ['sadf', 'SAFG', 'SergADG', 'SDgwergG', 'SG'],
    ['sdf', 'SAFG', 'SAsefDG', 'SDG', 'SgasG'],
    ['sadf', 'sdf', 'sergfsf', 'sdf', 'sdfasf'],
  ];
  List matchicons = [
    'assets/cricketlogo.jpg',
    'assets/cricketlogo2.jpg',
    'assets/cricketlogo3.jpg',
    'assets/t20.jpg',
    'assets/test.jpg'
  ];

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => contestListApi(context));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        // height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select The Tournaments',
                      style: heading,
                    ),
                    TextButton(
                        style: ButtonStyle(),
                        onPressed: () {
                          Get.to(AllTournaments(
                            contests: getx.allcontext,
                          ));
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ),

              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment. spaceBetween,
                      children: [
                        Text("Select Match",style: TextStyle(fontSize: 16),),
                        Icon(Icons.arrow_forward_ios_rounded,size: 18,)
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: matches[_selectedIndex].length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 1,
                        shadowColor: Colors.black12,
                        color: MyColors.sixty,
                        child: ListTile(
                          onTap: () {
                            Get.to(JoinTeam(heading: 'WTC',));
                          },
                          // splashColor: MyColors.thirty.withOpacity(0.5),
                          leading: SizedBox(
                            width: 45,
                            height: 45,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                matchicons[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(matches[_selectedIndex][index]),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [Expanded(child: Image.asset('assets/banner.png'))],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 700,
                      child: Obx(
                        () => getx.tournamentList.isNotEmpty
                            ? ListView.builder(
                                itemCount: getx.tournamentList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      allmatchListApi(
                                          context,
                                          getx.tournamentList[index]
                                              .contestTypeId
                                              .toString(),
                                          getx.tournamentList[index].userId
                                              .toString(),
                                          getx.tournamentList[index]
                                              .tournamentId
                                              .toString());
                                    },
                                    // leading: SizedBox(
                                    //   width: 45,
                                    //   height: 45,
                                    //   child: ClipRRect(
                                    //       borderRadius:
                                    //           BorderRadius.circular(50),
                                    //       child: Image.asset(
                                    //         matchicons[index],
                                    //         fit: BoxFit.cover,
                                    //       )),
                                    // ),
                                    title: Text(getx
                                        .tournamentList[index].tournamentName),
                                  );
                                },
                              )
                            : Center(child: CircularProgressIndicator()),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
