import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';

class Cpatainchoose extends StatefulWidget {
  RxList<Player> allplayerlist;
  MatchDetails match;
  RxList<Player> ar;
  Cpatainchoose(this.allplayerlist, this.match, this.ar, RxList<Player> bat,
      RxList<Player> blow, RxList<Player> wk,
      {super.key});

  @override
  State<Cpatainchoose> createState() =>
      _CpatainchooseState(allplayerlist, match);
}

class _CpatainchooseState extends State<Cpatainchoose> {
  Getx getx = Get.put(Getx());
  RxList<Player> allplayerlist;
  MatchDetails match;
  _CpatainchooseState(
    this.allplayerlist,
    this.match,
  );

  @override
  void dispose() {
    getx.captainchoose.value = "Captain gets";
    getx.vicecaptainchoose.value = "Vice Captain gets";
    getx.captainindexvalue.value = -1;
    getx.vicecaptainindexvalue.value = -1;
    // TODO: implement dispose
    super.dispose();
  }

  int beforindex = 1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 0,
        // leading: IconButton(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ),
        // ),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          // height: 100,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 117, 15, 7), Colors.black],
                  transform: GradientRotation(2))),
        ),
        title: const Text(
          'Create Team',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              '1h 53m left',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Container(
            // color: Colors.yellow,
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.sizeOf(context).width - 50,
                          child:  Text(
                            'Choose your Captain and Vice Captain',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 158, 158, 160),
                                  radius: 10,
                                  child: Text(
                                    'C',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                                 const SizedBox(width: 5,),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  getx.captainchoose.value.toString(),
                                  style:  TextStyle(
                                      color: Colors.white.withOpacity(0.8), fontSize: 13),
                                )
                              ],
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('2X (double) points',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.75),
                                      fontSize: 10,
                                    ))
                              ],
                            )
                          ],
                        )),
                        Expanded(
                            child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 10,
                                  child: Text(
                                    'VC',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 5,),

                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  getx.vicecaptainchoose.value.toString(),
                                  style:  TextStyle(
                                      color: Colors.white.withOpacity(0.8), fontSize: 13),
                                )
                              ],
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '1.5X points',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.75), fontSize: 10),
                                )
                              ],
                            )
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: allplayerlist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.1))),
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person),
                ),
                title: Text(
                  allplayerlist[index].playerName,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  allplayerlist[index].playerTypeName.toString(),
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(80)),
                          child: InkWell(
                            onTap: () {
                              if (getx.captainindexvalue.value != index) {
                                getx.captainindexvalue.value = index;
                                getx.captainchoose.value =
                                    allplayerlist[index].playerName;
                                if (getx.vicecaptainindexvalue.value == index) {
                                  getx.vicecaptainindexvalue.value =
                                      -1; // Deselect Vice Captain
                                }
                              } else {
                                getx.captainindexvalue.value =
                                    -1; // Deselect Captain
                              }
                              print(getx.captainindexvalue.value);
                            },
                            borderRadius: BorderRadius.circular(80),
                            child: CircleAvatar(
                              backgroundColor:
                                  getx.captainindexvalue.value == index
                                      ? Colors.black
                                      : Colors.white,
                              child: Text(
                                'C',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: getx.captainindexvalue.value == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              // radius: 10,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(80)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(80),
                            onTap: () {
                              if (getx.vicecaptainindexvalue.value != index) {
                                getx.vicecaptainindexvalue.value = index;
                                getx.vicecaptainchoose.value =
                                    allplayerlist[index].playerName;
                                if (getx.captainindexvalue.value == index) {
                                  getx.captainindexvalue.value =
                                      -1; // Deselect Captain
                                }
                              } else {
                                getx.vicecaptainindexvalue.value =
                                    -1; // Deselect Vice Captain
                              }

                              print(getx.vicecaptainindexvalue.value);
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  getx.vicecaptainindexvalue.value == index
                                      ? Colors.black
                                      : Colors.white,
                              child: Text(
                                'VC',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: getx.vicecaptainindexvalue.value ==
                                            index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              // radius: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          disabledElevation: 50,
          onPressed: () async {
            if (getx.captainindexvalue.value != -1 &&
                getx.vicecaptainindexvalue.value != -1) {
              print(match.tournamentMatchesId);
              User? user = await UserPreferences().getUser();
              for (int i = 0; i < allplayerlist.length; i++) {
                bool checktype1 = widget.allplayerlist[i].playerName ==
                    getx.captainchoose.value;
                bool checktype2 = widget.allplayerlist[i].playerName ==
                    getx.vicecaptainchoose.value;

                await teamSaveListApi(
                    context,
                    allplayerlist[i].playerID.toString(),
                    match.contestId,
                    user!.userId.toString(),
                    match.tournamentMatchesId.toString(),
                    checktype1.toString(),
                    checktype2.toString());
              }
               showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const Text('Your team has been saved successfully!'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.back();
                },
              ),
            ],
          );
        },
      );
            }
          },
          backgroundColor: getx.captainindexvalue.value != -1 &&
                  getx.vicecaptainindexvalue.value != -1
              ? Colors.green
              : Colors.grey,
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
