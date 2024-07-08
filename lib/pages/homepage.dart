import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/colors/mycolor.dart';
import 'package:apna_cricket/pages/alltournaments.dart';
import 'package:apna_cricket/pages/jointeampage.dart';
import 'package:apna_cricket/pages/playerlist.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var heading = const TextStyle(fontSize: 16);
  Getx getx = Get.put(Getx());
  int _selectedIndex = 0;
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  List matchicons = [
    'assets/cricketlogo.jpg',
    'assets/cricketlogo2.jpg',
    'assets/cricketlogo3.jpg',
    'assets/t20.jpg',
    'assets/test.jpg'
  ];
  List carasonimg = [
    'assets/banner.png',
    'assets/hardik_banner.png',
    'assets/rohit_banner.png',
  ];

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => contestListApi(context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        // height: height,
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
                        style: const ButtonStyle(),
                        onPressed: () {
                          Get.to(AllTournaments(
                            contests: getx.allcontext,
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
                    child: Obx(
                      () => getx.allcontext.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: getx.allcontext.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: MaterialButton(
                                    color: _selectedIndex == index
                                        ? Colors.blue
                                        : Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                      tournamentListApi(
                                          context,
                                          getx.allcontext[index].contestTypeId
                                              .toString());
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
                                      getx.allcontext[index].contestTypeName,
                                      style: TextStyle(
                                        color: _selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: Row(
              //     children: [Expanded(child: Image.asset('assets/banner.png'))],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(children: [
                  InkWell(
                    child: CarouselSlider(
                      items: carasonimg
                          .map(
                            (item) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      item,
                                    ),
                                    // fit: BoxFit.fill,
                                  ),
                                )),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: carasonimg.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 10 : 5,
                            height: 5,
                            margin: const EdgeInsets.symmetric(horizontal: 3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Match",
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                    Obx(
                      () => getx.tournamentList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: getx.tournamentList.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 1,
                                  shadowColor: Colors.black12,
                                  color: MyColors.sixty,
                                  child: ListTile(
                                    onTap: () {
                                      allmatchListApi(
                                          context,
                                          getx.tournamentList[index]
                                              .contestTypeId
                                              .toString(),
                                          getx.tournamentList[index].userId
                                              .toString(),
                                          getx.tournamentList[index]
                                              .tournamentId
                                              .toString());
                                      Get.to(JoinTeam(
                                        heading: getx.tournamentList[index]
                                            .tournamentName,
                                      ));
                                    },
                                    // splashColor: MyColors.thirty.withOpacity(0.5),
                                    leading: SizedBox(
                                      width: 45,
                                      height: 45,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          matchicons[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    title: Text(getx
                                        .tournamentList[index].tournamentName),
                                  ),
                                );
                              },
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
