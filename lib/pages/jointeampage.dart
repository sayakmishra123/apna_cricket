import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:apna_cricket/colors/mycolor.dart';
import 'package:apna_cricket/pages/playerlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinTeam extends StatelessWidget {
  final String heading;
  const JoinTeam({super.key, required this.heading});
  final double _teamiconsize = 40.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.thirty,
          title: Text(heading),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
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
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Text(
                                                    'ABC',
                                                    style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
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
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        gradient:
                                                            RadialGradient(
                                                                colors: [
                                                              Colors.black,
                                                              MyColors.thirty
                                                                  .withOpacity(
                                                                      0.2)
                                                            ])),
                                                    child: SizedBox(
                                                        width: _teamiconsize,
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            child: Image.asset(
                                                                'assets/sixers.png'))),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'ENGLAND',
                                                    style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              color: Colors.black54,
                                              width: 40,
                                              height: 1,
                                              child: const SizedBox(),
                                            ),
                                            SizedBox(
                                              width: 70,
                                              height: 70,
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
                                                                fontSize: 30,
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
                                              color: Colors.black54,
                                              width: 40,
                                              height: 1,
                                              child: const SizedBox(),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        gradient:
                                                            RadialGradient(
                                                                colors: [
                                                              Colors.black,
                                                              MyColors.thirty
                                                                  .withOpacity(
                                                                      0.2)
                                                            ])),
                                                    child: SizedBox(
                                                        width: _teamiconsize,
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            child: Image.asset(
                                                                'assets/jaffna.jfif'))),
                                                  ),
                                                  Text('INDIA',
                                                      style: const TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 12)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
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
                                            const Text(
                                              'time',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),

                                            InkWell(
                                              onTap: () {
                                                Get.to(() => PlayerList());
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.green,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 30),
                                                child: const Text(
                                                  'Join',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )

                                            // const Text("Entry Ended"),
                                          ],
                                        ),
                                      ],
                                    ),
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
