import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MilesHistory extends StatefulWidget {
  int userId;
  MilesHistory(this.userId, {super.key});

  @override
  State<MilesHistory> createState() => _MilesHistoryState(userId);
}

class _MilesHistoryState extends State<MilesHistory> {
  int userId;
  _MilesHistoryState(this.userId);
  Getx getx = Get.put(Getx());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      milesListApi(context);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    getx.mileshistory.clear();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.black],
                  transform: GradientRotation(2))),
        ),
        title: const Text(
          'Miles History',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Column(children: [
        Card(
          child: Container(
            color: Colors.green,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Opening balance',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Miles',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Balance:00',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => getx.mileshistory.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: getx.mileshistory.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                getx.mileshistory[index]['MilesDate'],
                                style: TextStyle(),
                              ),
                              Text(
                                getx.mileshistory[index]['Miles'].toString(),
                                style: TextStyle(),
                              ),
                              Text(
                                  getx.mileshistory[index]['RemaningBalance']
                                      .toString(),
                                  style: TextStyle()),
                            ],
                          ),
                        ),
                      );
                      //  ListTile(
                      //   // titleTextStyle: TextStyle(),
                      //   leading: Container(
                      //       alignment: Alignment.center,
                      //       // color: Colors.red,
                      //       width: 100,
                      //       child: Text(
                      //         getx.mileshistory[index]['MilesDate'],
                      //         // textScaler: TextScaler.linear(2),
                      //       )),
                      //   title: Container(
                      //       alignment: Alignment.center,
                      //       // color: Colors.green,
                      //       width: 100,
                      //       child: Text(
                      //         overflow: TextOverflow.ellipsis,
                      //         getx.mileshistory[index]['Miles'].toString(),
                      //         textAlign: TextAlign.center,
                      //         // textScaler: TextScaler.linear(1.3),
                      //       )),
                      //   trailing: Container(
                      //       alignment: Alignment.center,
                      //       // color: Colors.blue,
                      //       width: 100,
                      //       child: Text(
                      //         getx.mileshistory[index]['RemaningBalance']
                      //             .toString(),
                      //         // textScaler: TextScaler.linear(2),
                      //       )),
                      // );
                    },
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        )
      ]),
    );
  }
}
