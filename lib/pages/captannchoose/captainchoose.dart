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
  Cpatainchoose(this.allplayerlist, {super.key});

  @override
  State<Cpatainchoose> createState() => _CpatainchooseState();
}

class _CpatainchooseState extends State<Cpatainchoose> {
  Getx getx = Get.put(Getx());

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
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          // height: 100,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 117, 15, 7), Colors.black],
                  transform: GradientRotation(2))),
        ),
        title: Text(
          'Create Team',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '1h 53m left',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130),
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
                          child: Text(
                            'Choose your Captain and Vice Captain',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
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
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  getx.captainchoose.value.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('2X (double) points',
                                    style: TextStyle(
                                      color: Colors.white,
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
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  getx.vicecaptainchoose.value.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '1.5X points',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
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
        itemCount: widget.allplayerlist.length,
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
                  widget.allplayerlist[index].playerName,
                  style: const TextStyle(fontSize: 14),
                ),
                subtitle:
                    Text(widget.allplayerlist[index].boundaries.toString()),
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
                                    widget.allplayerlist[index].playerName;
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
                                    widget.allplayerlist[index].playerName;
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
          onPressed: () {
            if (getx.captainindexvalue.value != -1 &&
                getx.vicecaptainindexvalue.value != -1) {
              // teamSaveListApi(context, widget.allplayerlist[0].playerID);
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
