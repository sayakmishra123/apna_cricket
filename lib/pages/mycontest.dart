import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:apna_cricket/pages/playerlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyContest extends StatefulWidget {
  const MyContest({super.key});

  @override
  State<MyContest> createState() => _MyContestState();
}

class _MyContestState extends State<MyContest> {
  List<String> cricketLeagues = [
    'India Super League T20',
    'Australia Big Bash T20',
    'Pakistan Super League T20',
    'Bangladesh Premier League T20',
    'Caribbean Premier League T20',
    'South Africa Cricket League T20',
    'New Zealand Cricket Bash T20',
    'England County T20 Championship',
    'UAE Premier League T20',
    'Nepal Cricket League T20',
  ];
  RxBool floatingbtn = false.obs;
  final double _teamiconsize = 40;
  late ScrollController _hideButtonController = ScrollController();

  @override
  void dispose() {
    _hideButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red[50],
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cricketLeagues.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Get.to(const PlayerList()),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.red.withOpacity(0.1),
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
                                                    gradient:
                                                        LinearGradient(colors: [
                                                  Colors.transparent,
                                                  Colors.grey.withOpacity(0.2),
                                                  Colors.transparent,
                                                ])),
                                                child: Center(
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Text(
                                                          cricketLeagues[index],
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black54),
                                                        ))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    gradient:
                                                        LinearGradient(colors: [
                                                      Colors.red.withOpacity(0),
                                                      Colors.red
                                                          .withOpacity(0.6),
                                                      Colors.red.withOpacity(0),
                                                    ])),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                              width:
                                                                  _teamiconsize,
                                                              child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/sixers.png'))),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          const Text(
                                                            'Dambullar Sixers',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 50,
                                                      child: DefaultTextStyle(
                                                        style: const TextStyle(
                                                          fontSize: 35,
                                                          color: Colors.white,
                                                          shadows: [
                                                            Shadow(
                                                              blurRadius: 10.0,
                                                              color:
                                                                  Colors.white,
                                                              offset:
                                                                  Offset(0, 0),
                                                            ),
                                                          ],
                                                        ),
                                                        child: AnimatedTextKit(
                                                          repeatForever: true,
                                                          animatedTexts: [
                                                            FlickerAnimatedText(
                                                                'VS'),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                              width:
                                                                  _teamiconsize,
                                                              child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/jaffna.jfif'))),
                                                          const Text(
                                                              'Jaffna Kinga',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize:
                                                                      12)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Column(
                                                children: [
                                                  Text(
                                                    "31-07-24",
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
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
                            const SizedBox(height: 20)
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 170,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
