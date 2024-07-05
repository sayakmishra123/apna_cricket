import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/colors/mycolor.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:apna_cricket/pages/contextdeatils.dart';
import 'package:apna_cricket/pages/playerlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyContest extends StatefulWidget {
  const MyContest({super.key});

  @override
  State<MyContest> createState() => _MyContestState();
}

class _MyContestState extends State<MyContest> {
  Getx getx = Get.put(Getx());
  RxBool floatingbtn = false.obs;
  final double _teamiconsize = 40;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      User? userid = await UserPreferences().getUser();
      await currentcontextListApi(context, userid!.userId.toString());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: getx.currentcontext.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Get.to(() => const ContextDetails()),
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
                                              color: MyColors.thirty
                                                  .withOpacity(0.08),
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
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Text(
                                                          getx
                                                              .currentcontext[
                                                                  index]
                                                              .tournamentName,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black54,fontWeight: FontWeight.w800),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              gradient:
                                                                  RadialGradient(
                                                                      colors: [
                                                                    Colors
                                                                        .black,
                                                                    MyColors
                                                                        .thirty
                                                                        .withOpacity(
                                                                            0.2)
                                                                  ])),
                                                          child: SizedBox(
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
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          getx
                                                              .currentcontext[
                                                                  index]
                                                              .team1Name,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black54,
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
                                                            speed: Durations.extralong1,
                                                              'VS',
                                                              textStyle: const TextStyle(
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
                                                                      .circular(
                                                                          30),
                                                              gradient:
                                                                  RadialGradient(
                                                                      colors: [
                                                                    Colors
                                                                        .black,
                                                                    MyColors
                                                                        .thirty
                                                                        .withOpacity(
                                                                            0.2)
                                                                  ])),
                                                          child: SizedBox(
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
                                                        ),
                                                        Text(
                                                            getx
                                                                .currentcontext[
                                                                    index]
                                                                .team2Name,
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .black54,
                                                                    fontSize:
                                                                        12)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          
                                              const SizedBox(height: 20,),
                                              Row(
                                                
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [Expanded(
                                                  child: Container(
                                                    margin: const EdgeInsets.symmetric(horizontal: 20),
                                                                                                color: Colors.black12,
                                                    
                                                      height: 1,
                                                      child: const SizedBox(),
                                                    ),
                                                ),],
                                              ),
                                              const SizedBox(height: 10,),

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    getx.currentcontext[index]
                                                        .matchStartDate,
                                                    style: const TextStyle(
                                                        fontSize: 15,fontWeight: FontWeight.w400),
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
                            // const SizedBox(height: 20)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
