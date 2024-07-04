import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/getx/getx.dart';
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
  const PlayerList({super.key});

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
    await teamplayersListApi(context);
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
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.black],
                      transform: GradientRotation(2))),
            ),

            title: const Text(
              'Player List',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(190),
                child: Column(
                  children: [
                    Container(
                      // color: Colors.blue,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.orange,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('A1')],
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
                            child: Container(
                              color: Colors.amber,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('A2')],
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
                            'Total selected player ${getx.add.value}/22'
                                .toUpperCase(),
                            style: TextStyle(
                                color: Colors.orange[200],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
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
                                color: Colors.yellow,
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
                              controllerAr.selectedIndices.clear();
                              controllerBat.selectedIndices.clear();
                              controllerBlow.selectedIndices.clear();
                              controllerWk.selectedIndices.clear();
                            },
                            icon: Icon(
                              Icons.remove_circle,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    const TabBar(
                        isScrollable: false,
                        labelStyle: TextStyle(color: Colors.white),
                        tabs: [
                          Tab(
                            text: 'WK(1)',
                          ),
                          Tab(
                            text: 'BAT(1)',
                          ),
                          Tab(
                            text: 'AR(1)',
                          ),
                          Tab(
                            text: 'BOWL(1)',
                          )
                        ]),
                  ],
                )),
          ),
          body: TabBarView(
            children: [Wk(), Bat(), Ar(), Blow()],
          ),
        ),
      ),
    );
  }
}
