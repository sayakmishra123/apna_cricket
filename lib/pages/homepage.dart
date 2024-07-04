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
  List matchicons = [
    'assets/cricketlogo.jpg',
    'assets/cricketlogo2.jpg',
    'assets/cricketlogo3.jpg',
    'assets/t20.jpg',
    'assets/test.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 20,),
              
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: contests.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: MaterialButton(
                            color: _selectedIndex == index
                                ? Colors.blue
                                : Colors.white,
                            onPressed: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: _selectedIndex == index
                                    ? Colors.blue
                                    : Colors.lightBlueAccent,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              contests[index],
                              style: TextStyle(
                                color: _selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
                Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),

                  child: Row(
                  children: [Expanded(child: Image.asset('assets/banner.png'))],
                                ),
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
                          return ListTile(
                         

leading: SizedBox(
  width: 45,
  height: 45,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: Image.asset(matchicons[index],fit: BoxFit.cover,)),
),
                            title: Text(matches[_selectedIndex][index]),

                          );
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
