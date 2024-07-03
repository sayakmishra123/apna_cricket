import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyContest extends StatefulWidget {
  const MyContest({super.key});

  @override
  State<MyContest> createState() => _MyContestState();
}

class _MyContestState extends State<MyContest> {
  final double _teamiconsize = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[50],
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text('My Contests',style: TextStyle(fontSize: 20),),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                                      gradient: LinearGradient(
                                                          colors: [
                                                        Colors.transparent,
                                                        Colors.grey
                                                            .withOpacity(0.12),
                                                        Colors.transparent,
                                                      ])),
                                                  child: const Center(
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.all(3),
                                                          child: Text(
                                                            'Lanka Premier League T20',
                                                            style: TextStyle(
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
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                            width:
                                                                _teamiconsize,
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                child: Image.asset(
                                                                    'assets/sixers.png'))),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'Dambullar Sixers',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text('Jaffna Kinga',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 12)),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                _teamiconsize,
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                child: Image.asset(
                                                                    'assets/jaffna.jfif'))),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(15),
                                                      color: Colors.red[100],

                                                      ),
                                                      padding: EdgeInsets.all(5),
                                                      child: Text(
                                                        "31-07-24",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Text("Entry Ended"),
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
                              SizedBox(height: 20,)
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
