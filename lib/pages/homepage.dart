import 'package:apna_cricket/pages/alltournaments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var heading = const TextStyle(fontSize: 16);
  int _selectedIndex = 0;
  List contests = [
    "All Match Contest",
    "Single Match Contest",
    "double Match Contest",
    "All Match Contest",
    "Single Match Contest",
    "double Match Contest",
    "All Match Contest",
    "Single Match Contest",
    "double Match Contest",
    "double Match Contest",
  ];
  List matches = [
    [
      'T20',
      'TEST MATCH',
      'WTC20',
      'T20',
    ],
    ['TEST MATCH', 'WTC20', 'SDG', 'TEST MATCH', 'abc20'],
    ['SDGSDFGDG', 'DrFG', 'SDgFG', 'SDggFGH', 'YHgaIKT'],
    ['frthrthawerF', 'SaergG', 'SADG', 'SDG', 'SG'],
    ['sfsf', 'SAFG', 'SADG', 'SDgwG', 'SgawgG'],
    ['sf', 'SAFG', 'SAergDG', 'SDgG', 'SgG'],
    ['sdf', 'SAFG', 'SArgDG', 'SDgG', 'SggG'],
    ['sadf', 'SAFG', 'SergADG', 'SDgwergG', 'SG'],
    ['sdf', 'SAFG', 'SAsefDG', 'SDG', 'SgasG'],
    ['sadf', 'sdf', 'sergfsf', 'sdf', 'sdfasf'],
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 20,),
              Row(
                children: [Expanded(child: Image.asset('assets/banner.png'))],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select The Tournaments',
                      style: heading,
                    ),
                    TextButton(
                        style: ButtonStyle(),
                        onPressed: () {
                          Get.to(AllTournaments(
                            contests: contests,
                          ));
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: width,
                    child: Expanded(
                        child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      // Colors.red.withOpacity(0.8),
                                      // Colors.orange.withOpacity(0.2)
                                    ]),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.red.withOpacity(0.05),
                                          blurRadius: 20,
                                          offset: const Offset(5, 5)),
                                    ]),
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'All Match Contest',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                gradient:
                                                    LinearGradient(colors: [
                                                  Colors.blue.withOpacity(0.01),
                                                  Colors.blue.withOpacity(0.4),
                                                  Colors.blue,
                                                  Colors.blue,
                                                ]),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(
                                                                20))),
                                            child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 2),
                                                child: Text('Contest')))
                                      ],
                                    )
                                  ],
                                ),
                              );
                            })),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 700,
                      child: ListView.builder(
                        itemCount: matches[_selectedIndex].length,
                        itemBuilder: (context, index) {
                          return Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: MaterialButton(
                              height: 60,
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 10,
                              color: Colors.white,
                              onPressed: () {},
                              child: Text(matches[_selectedIndex][index]),
                            ),
                          ));
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
