import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:apna_cricket/colors/mycolor.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/pages/playerlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinTeam extends StatelessWidget {
  final String heading;

  JoinTeam({super.key, required this.heading});
  final double _teamiconsize = 50.0;
  Getx getx = Get.put(Getx());
  @override
  Widget build(BuildContext context) {
    // New join team
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: MyColors.thirty,
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: MyColors.appbargradient),
          ),
          title: Text(
            heading,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: Obx(
          () => Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: getx.matchdetails.length,
                itemBuilder: (context, index) {
                  var data = getx.matchdetails[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.black45),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            MyColors.thirty.withOpacity(0.08),
                                        blurRadius: 20,
                                        offset: const Offset(10, 10)),
                                  ]),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.grey.withOpacity(0.05),
                                            Colors.grey.withOpacity(0.3),
                                            Colors.grey.withOpacity(0.05),
                                            Colors.transparent,
                                            Colors.transparent,
                                          ])),
                                          child: Center(
                                              child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(
                                                    data.tournamentName,
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                    width: _teamiconsize,
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        child: Image.asset(
                                                            'assets/sixers.png'))),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  data.team1Name,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black54,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    color: Colors.green,
                                                    width: 40,
                                                    height: 1,
                                                    child: const SizedBox(),
                                                  ),
                                                  SizedBox(
                                                    width: 65,
                                                    height: 65,
                                                    child: Center(
                                                      child: AnimatedTextKit(
                                                        repeatForever: true,
                                                        animatedTexts: [
                                                          FlickerAnimatedText(
                                                              speed: Durations
                                                                  .extralong1,
                                                              'VS',
                                                              textStyle:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      color: Colors
                                                                          .amber,
                                                                      shadows: [
                                                                    Shadow(
                                                                        blurRadius:
                                                                            12,
                                                                        color: Colors
                                                                            .amber)
                                                                  ])),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.red,
                                                    width: 40,
                                                    height: 1,
                                                    child: const SizedBox(),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              )
                                            ],
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                    width: _teamiconsize,
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        child: Image.asset(
                                                            'assets/jaffna.jfif'))),
                                                Text(
                                                  data.team2Name,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black54,
                                                      fontSize: 16),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              color: Colors.black12,
                                              height: 1,
                                              child: const SizedBox(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                data.matchStartDate,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                data.matchStartTime,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),

                                          MaterialButton(
                                            shape: ContinuousRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            onPressed: () {
                                              Get.to(() => PlayerList(data));
                                            },
                                            color: Colors.pink[400],
                                            child: Text(
                                              '${data.entryMiles} Miles',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )

                                          // const Text("Entry Ended"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 20)
                    ],
                  );
                },
              ))
            ],
          ),
        ));
  }
}
