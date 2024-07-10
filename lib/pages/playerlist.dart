import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:apna_cricket/pages/captannchoose/captainchoose.dart';
import 'package:apna_cricket/pages/playerlistSelect/ar.dart';
import 'package:apna_cricket/pages/playerlistSelect/bat.dart';
import 'package:apna_cricket/pages/playerlistSelect/blow.dart';
import 'package:apna_cricket/pages/playerlistSelect/wk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PlayerList extends StatefulWidget {
  MatchDetails match;
  PlayerList(this.match, {super.key});

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  late double vsLine = 170;
  Getx getx = Get.put(Getx());
  TextStyle teamNameStyle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w800,
  );
  SelectionControllerWk controllerWk = Get.put(SelectionControllerWk());
  SelectionControllerBlow controllerBlow = Get.put(SelectionControllerBlow());
  SelectionControllerBat controllerBat = Get.put(SelectionControllerBat());
  SelectionControllerAr controllerAr = Get.put(SelectionControllerAr());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((visibleForTesting) =>
        // Future.delayed(Duration(seconds: 3), () {
        fetchteam().whenComplete(() => null));
    // });
  }

  Future fetchteam() async {
    if (widget.match.numberOfPlayers <= 11) {
      await singleteamplayersListApi(context, widget.match);
    } else {
      await allteamplayersListApi(context, widget.match);
    }
  }

  @override
  void dispose() {
    getx.add.value = 0;
    controllerAr.selectedIndices.clear();
    controllerBat.selectedIndices.clear();
    controllerBlow.selectedIndices.clear();
    controllerWk.selectedIndices.clear();
    getx.selectedplayer.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            // leading: IconButton(
            //     onPressed: () {
            //       Get.back();
            //     },
            //     icon: Icon(
            //       Icons.arrow_back,
            //       color: Colors.white,
            //     )),
            automaticallyImplyLeading: true,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: const [
              Icon(
                Icons.timer_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  '20:00:00',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],

            // backgroundColor: ,
            flexibleSpace: Container(
              height: 400,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 117, 15, 7), Colors.black],
                      transform: GradientRotation(2))),
            ),

            title: const Text(
              'Player List',
              style: TextStyle(
                color: Colors.white,

                // fontSize: 16
              ),
            ),
            bottom: PreferredSize(
              // preferredSize: getx.add.value == 0
              //     ? Size.fromHeight(140)
              //     : Size.fromHeight(190),
              preferredSize: const Size.fromHeight(200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

   

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      // TEAM 1
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              widget.match.team1Name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  shadows: [
                                    Shadow(blurRadius: 40, color: Colors.red)
                                  ]),
                            ),
                            Image.asset(
                              'assets/team1_line.png',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        // width: 120,
                        height: 70,
                        child: LottieBuilder.asset(
                          'assets/animate.json',
                        ),
                      ),
                      // TEAM 2
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              widget.match.team2Name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                  shadows: [
                                    Shadow(color: Colors.green, blurRadius: 40)
                                  ]),
                            ),
                            Image.asset(
                              'assets/team2_line.png',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'SELECTED PLAYERS  ${getx.add.value}/${widget.match.numberOfPlayers}',
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                    child: Visibility(
                      visible: getx.add.value == 0 ? false : true,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            // color: Colors.green,
                            width: MediaQuery.sizeOf(context).width - 50,
                            height: 20,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: getx.add.value,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Container(
                                  color: Colors.amber,
                                  // margin: EdgeInsets.only(right: 2),
                                  width: 10,
                                  height: 3,
                                  // child: Text(getx.add.value.toString()),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                getx.add.value = 0;
                                getx.isColor.value = true;
                                setState(() {
                                  controllerAr.selectedIndices.clear();
                                  controllerBat.selectedIndices.clear();
                                  controllerBlow.selectedIndices.clear();
                                  controllerWk.selectedIndices.clear();
                                  getx.selectedplayer.clear();
                                });
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline_rounded,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  TabBar(
                      unselectedLabelColor: Colors.white54,
                      // overlayColor:
                      //     const MaterialStatePropertyAll(Colors.green),
                      tabAlignment: TabAlignment.center,
                      // unselectedLabelColor: Colors.red,
                      automaticIndicatorColorAdjustment: true,
                      indicatorColor: Colors.amber,
                      indicatorWeight: 5,
                      // indicator: BoxDecoration(color: Colors.red),
                      isScrollable: true,
                      labelStyle: GoogleFonts.josefinSans()
                          .copyWith(color: Colors.amber[200]),
                      tabs: [
                        Tab(
                          text: 'WK(${getx.wk.length})',
                        ),
                        Tab(
                          text: 'BAT(${getx.bat.length})',
                        ),
                        Tab(
                          text: 'AR(${getx.ar.length})',
                        ),
                        Tab(
                          text: 'BOWL(${getx.blow.length})',
                        )
                      ]),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Wk(widget.match),
              Bat(widget.match),
              Ar(widget.match),
              Blow(widget.match)
            ],
          ),
        
          floatingActionButton: FloatingActionButton(

            backgroundColor: getx.add.value == widget.match.numberOfPlayers
                ? Colors.green
                : Colors.grey,
            onPressed: () {
              print(widget.match.numberOfPlayers);
              if (getx.selectedplayer.length == widget.match.numberOfPlayers) {
                Get.to(() => Cpatainchoose(getx.selectedplayer, widget.match,
                    getx.ar, getx.bat, getx.blow, getx.wk));
              }
            },
            // child: getx.add.value == widget.match.numberOfPlayers
            //     ? const Text(
            //         'Next',
            //         style: TextStyle(color: Colors.white),
            //       )
            //     : const Text('Next', style: TextStyle(color: Colors.white)),
            child: const Icon(Icons.arrow_forward_rounded),
          ),
        ),
      ),
    );
  }
}
