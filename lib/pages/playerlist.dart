import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:apna_cricket/pages/captannchoose/captainchoose.dart';
import 'package:apna_cricket/pages/playerlistSelect/ar.dart';
import 'package:apna_cricket/pages/playerlistSelect/bat.dart';
import 'package:apna_cricket/pages/playerlistSelect/blow.dart';
import 'package:apna_cricket/pages/playerlistSelect/wk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PlayerList extends StatefulWidget {
  MatchDetails match;
  PlayerList(this.match, {super.key});

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  Getx getx = Get.put(Getx());
  SelectionControllerWk controllerWk = Get.put(SelectionControllerWk());
  SelectionControllerBlow controllerBlow = Get.put(SelectionControllerBlow());
  SelectionControllerBat controllerBat = Get.put(SelectionControllerBat());
  SelectionControllerAr controllerAr = Get.put(SelectionControllerAr());

  @override
  void initState() {
    // TODO: implement initState
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
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            actions: const [
              Icon(
                Icons.timer,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  '20:00:00',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
            // backgroundColor: ,
            flexibleSpace: Container(
              // height: 100,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 117, 15, 7), Colors.black],
                      transform: GradientRotation(2))),
            ),

            title: const Text(
              'Player List',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            bottom: PreferredSize(
              preferredSize: getx.add.value == 0
                  ? Size.fromHeight(140)
                  : Size.fromHeight(190),
              child: Column(
                children: [
                  Container(
                    // color: Colors.blue,
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 10,
                            child: Container(
                              height: 50,
                              color: Colors.orange,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('A1')],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          // width: 80,
                          height: 80,
                          child: LottieBuilder.asset(
                            'assets/animate.json',
                            // width: 30,
                          ),
                        ),
                        Expanded(
                          child: Card(
                            elevation: 20,
                            child: Container(
                              height: 50,
                              color: Colors.amber,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('A2')],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          'Total selected player ${getx.add.value}/${widget.match.numberOfPlayers}',
                          style: TextStyle(
                              color: Color.fromARGB(255, 52, 194, 9),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
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
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                color: Colors.green,
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
                              Icons.remove_circle,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 194, 20, 7),
                      Color.fromARGB(255, 0, 0, 0)
                    ], transform: GradientRotation(2))),

                    // color: Color.fromARGB(255, 1, 9, 37),
                    child: TabBar(
                        overlayColor: MaterialStatePropertyAll(Colors.green),
                        tabAlignment: TabAlignment.center,
                        // unselectedLabelColor: Colors.red,
                        automaticIndicatorColorAdjustment: true,
                        dividerColor: Colors.red,
                        // indicatorColor: Colors.,
                        // indicator: BoxDecoration(color: Colors.red),
                        // isScrollable: false,
                        isScrollable: true,
                        // indicatorWeight: 10,
                        labelStyle: TextStyle(color: Colors.white),
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
                  ),
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
                for (int i = 0; i < getx.selectedplayer.length; i++) {
                  print(getx.selectedplayer[i].userId);
                }
                print(getx.selectedplayer);
                print(getx.selectedplayer[2].contestId);
                Get.to(() => Cpatainchoose(getx.selectedplayer, widget.match,
                    getx.ar, getx.bat, getx.blow, getx.wk));
              }
            },
            child: getx.add.value == widget.match.numberOfPlayers
                ? const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  )
                : const Text('Next', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
