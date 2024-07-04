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
                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 7,
                          spreadRadius: 1,
                          offset: Offset(5, 5),
                        )
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('30-06-24'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(heading),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: _teamiconsize,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.asset(
                                              'assets/sixers.png'))),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Dambullar Sixers',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: SizedBox(
                                width: 50,
                                height: 40,
                                child: DefaultTextStyle(
                                  style: const TextStyle(
                                    fontSize: 35,
                                    color: Colors.red,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.red,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      FlickerAnimatedText('VS'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: _teamiconsize,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.asset(
                                              'assets/jaffna.jfif'))),
                                  const Text('Jaffna Kinga',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.blue),
                                child: Text('20.00 Minutes'))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => PlayerList());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: const Text(
                                  'Join',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ))
            ],
          ),
        ));
  }
}
