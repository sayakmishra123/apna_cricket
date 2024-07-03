import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MyContest extends StatefulWidget {
  const MyContest({super.key});

  @override
  State<MyContest> createState() => _MyContestState();
}

class _MyContestState extends State<MyContest> {
  RxBool floatingbtn = false.obs;
  final double _teamiconsize = 40;
  late ScrollController _hideButtonController;
  RxBool _isVisible = true.obs;

  @override
  void initState() {
    super.initState();
    _hideButtonController = ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isVisible.value == true) {
          _isVisible.value = false;
        }
      } else if (_hideButtonController.position.userScrollDirection == ScrollDirection.forward) {
        if (_isVisible.value == false) {
          _isVisible.value = true;
        }
      }
    });
  }

  @override
  void dispose() {
    _hideButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Obx(() => Scaffold(
      floatingActionButton: _isVisible.value
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    floatingbtn.value = false;
                  },
                  child: Container(
                    height: 40,
                    width: width / 2.5,
                    decoration: BoxDecoration(
                      color: floatingbtn.value ? Colors.white : Colors.blue,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: const Center(child: Text('My Contest')),
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    floatingbtn.value = true;
                  },
                  child: Container(
                    height: 40,
                    width: width / 2.5,
                    decoration: BoxDecoration(
                      color: floatingbtn.value ? Colors.blue : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: const Center(child: Text('Recent Contest')),
                  ),
                ),
              ],
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.red[50],
      body: SingleChildScrollView(
        controller: _hideButtonController,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: !floatingbtn.value
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Column(
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
                                                  color: Colors.red.withOpacity(0.1),
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
                                                        gradient: LinearGradient(
                                                            colors: [
                                                              Colors.transparent,
                                                              Colors.grey.withOpacity(0.12),
                                                              Colors.transparent,
                                                            ])),
                                                    child: const Center(
                                                        child: Padding(
                                                            padding: EdgeInsets.all(3),
                                                            child: Text(
                                                              'Lanka Premier League T20',
                                                              style: TextStyle(
                                                                  color: Colors.black54),
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
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                              width: _teamiconsize,
                                                              child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(50),
                                                                  child: Image.asset('assets/sixers.png'))),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Text(
                                                            'Dambullar Sixers',
                                                            style: TextStyle(color: Colors.black54, fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Text('Jaffna Kinga',
                                                              style: TextStyle(color: Colors.black54, fontSize: 12)),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          SizedBox(
                                                              width: _teamiconsize,
                                                              child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(50),
                                                                  child: Image.asset('assets/jaffna.jfif'))),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          color: Colors.red[100],
                                                        ),
                                                        padding: const EdgeInsets.all(5),
                                                        child: const Text(
                                                          "31-07-24",
                                                          style: TextStyle(fontSize: 15),
                                                        ),
                                                      ),
                                                      const Text("Entry Ended"),
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
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 12,
                          itemBuilder: (context, index) {
                            return Column(
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
                                                  color: Colors.red.withOpacity(0.1),
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
                                                        gradient: LinearGradient(
                                                            colors: [
                                                              Colors.transparent,
                                                              Colors.grey.withOpacity(0.12),
                                                              Colors.transparent,
                                                            ])),
                                                    child: const Center(
                                                        child: Padding(
                                                            padding: EdgeInsets.all(3),
                                                            child: Text(
                                                              'Lanka Premier League T20',
                                                              style: TextStyle(color: Colors.black54),
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
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                              width: _teamiconsize,
                                                              child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(50),
                                                                  child: Image.asset('assets/sixers.png'))),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Text(
                                                            'Dambullar Sixers',
                                                            style: TextStyle(color: Colors.black54, fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Text('Jaffna Kinga',
                                                              style: TextStyle(color: Colors.black54, fontSize: 12)),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          SizedBox(
                                                              width: _teamiconsize,
                                                              child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(50),
                                                                  child: Image.asset('assets/jaffna.jfif'))),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          color: Colors.red[100],
                                                        ),
                                                        padding: const EdgeInsets.all(5),
                                                        child: const Text(
                                                          "31-07-24",
                                                          style: TextStyle(fontSize: 15),
                                                        ),
                                                      ),
                                                      const Text("Entry Ended"),
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
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    ));
  }
}
