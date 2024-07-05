import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/colors/mycolor.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:apna_cricket/pages/homepage.dart';
import 'package:apna_cricket/pages/mileshistory.dart/mileshistory.dart';

import 'package:apna_cricket/pages/morepage.dart';
import 'package:apna_cricket/pages/mycontest.dart';
import 'package:apna_cricket/pages/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var profilestyle = const TextStyle(color: Colors.white);

  final RxInt _selectedIndex = 0.obs;
  List<Widget> pages = [
    const HomePage(),
    const MyContest(),
    // const ProfilePage(),
    const MorePage(),
  ];
  _handleIndexChange(int index) {
    setState(() {
      _selectedIndex.value = index;
    });
  }

  late User user = User(
      userId: 0,
      userName: 'userName',
      userEmail: 'userEmail',
      userMobileNo: 'userMobileNo',
      address: 'address',
      state: 'state',
      country: 'country',
      points: 0,
      franchiseId: 0,
      sortedOrder: 0,
      isActive: false,
      isDelete: false,
      mode: 0);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // getshareddata();
    });
    // TODO: implement initState
    super.initState();
  }

  Future getshareddata() async {
    user = (await UserPreferences().getUser())!;
    setState(() {});
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.black],
                          transform: GradientRotation(2))),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    'assets/nodp.jpg',
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  user.userName,
                                  style: profilestyle,
                                ),
                                Text(user.userEmail, style: profilestyle),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.attach_money_outlined),
                  title: const Text('Fantasy Miles'),
                  onTap: () {
                    Get.to(() => MilesHistory(user.userId));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.lock_outlined),
                  title: const Text('Change Password'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.more_horiz_rounded),
                  title: const Text('More'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Log Out'),
                  leading: const Icon(Icons.logout_rounded),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
         flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [MyColors.thirty, Colors.black87],
                  transform: GradientRotation(2))),
        ),
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(8)),
        // backgroundColor: Colors.red,
        actions: [
          InkWell(
            onTap: () {
              _key.currentState!.openDrawer();
            },
            child: SizedBox(
              width: 40,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/nodp.jpg')),
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
        automaticallyImplyLeading: false,
        // title: Row(
        //   children: [
        //     SizedBox(
        //         height: 60, width: 60, child: Image.asset('assets/logo.png'))
        //   ],
        // ),
        title:  Text('Apna Cricket',style: TextStyle(color: Colors.white),),
      ),
      body: pages[_selectedIndex.value],
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: _handleIndexChange,
          selectedIndex: _selectedIndex.value,
          shadowColor: Colors.cyan,
          backgroundColor: Colors.transparent,
          height: 80,
          elevation: 0,
          // indicatorColor: const Color.fromARGB(255, 53, 48, 48).withOpacity(0.1),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.emoji_events_outlined), label: 'My Contest'),
            // NavigationDestination(
            //     icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
            NavigationDestination(
                icon: Icon(Icons.more_horiz_outlined), label: 'More'),
          ]),
    );
  }
}
