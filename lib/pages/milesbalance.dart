import 'package:apna_cricket/colors/mycolor.dart';
import 'package:apna_cricket/dashboard.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:apna_cricket/pages/mycontest.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MilesBalance extends StatelessWidget {
  RxList<Player> allplayerlist;
  String captainame;
  String vicecaptain;

  MatchDetails match;
  MilesBalance(
      this.allplayerlist, this.vicecaptain, this.captainame, this.match,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: MyColors.appbargradient),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Miles Balance',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        actions: [
          Text(
            'Contest Entry: ${match.entryMiles}',
            style: TextStyle(fontSize: 10, color: Colors.white),
          )
        ],
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              color: const Color.fromARGB(255, 235, 233, 233),
              child: Row(children: [
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                      border: Border(right: BorderSide(width: 0.1))),
                  // color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/purse.png',
                                width: 20,
                              ),
                              const Text(
                                ' Available bal',
                                style: TextStyle(color: Colors.green),
                              )
                            ],
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: 16,
                                weight: 5,
                              ),
                              Text(
                                '2000',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )),
                const Expanded(
                  child: Row(),
                )
              ]),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Match ${match.team1Name} vs ${match.team2Name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Captain: $captainame',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Vice Captain: $vicecaptain',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
        ],
      ),
      bottomNavigationBar: Card(
        child: Container(
          height: 80,
          // color: Colors.red,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      // width: MediaQuery.sizeOf(context).width - 60,
                      child: const Text(
                        textAlign: TextAlign.justify,
                        'Proceed to verify your details and join the contest',
                        style: TextStyle(fontSize: 12),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 50,
                    child: MaterialButton(
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.green,
                      onPressed: () {
                        ElegantNotification.success(
                          title: Text("Update"),
                          description: Text("Miles payment successfully"),
                        ).show(context);
                        Future.delayed(Duration(seconds: 4), () {
                          Get.to(
                            () => const DashBoard(),
                            transition: Transition.leftToRight,
                          );
                        });
                      },
                      child: Text(
                        'Confirm ${match.entryMiles} points',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
