import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/colors/mycolor.dart';
import 'package:apna_cricket/login/login.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:apna_cricket/pages/homepage.dart';
import 'package:apna_cricket/pages/mileshistory.dart/mileshistory.dart';

import 'package:apna_cricket/pages/morepage.dart';
import 'package:apna_cricket/pages/mycontest.dart';
import 'package:apna_cricket/pages/profile/changepasswordpage.dart';
// import 'package:apna_cricket/pages/profilepage.dart';
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

  @override
  void initState() {
    getshareddata();

    super.initState();
  }

  User? user;

  Future getshareddata() async {
    user = await UserPreferences().getUser();
    setState(() {});
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return user != null
        ? DefaultTabController(
            length: 2,
            child: Scaffold(
              key: _key,
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(
                          gradient: MyColors.appbargradient),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                user!.userName,
                                style: profilestyle,
                              ),
                              Text(user!.userMobileNo, style: profilestyle),
                              Text(user!.userEmail, style: profilestyle),
                            ],
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.attach_money_outlined),
                      title: const Text('Fantasy Miles'),
                      onTap: () {
                        Get.to(() => MilesHistory(user!.userId));
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.lock_outlined),
                      title: const Text('Change Password'),
                      onTap: () {
                        Get.to(() => const ChangePassword());
                      },
                    ),
                    ListTile(
                      title: const Text('Log Out'),
                      leading: const Icon(Icons.logout_rounded),
                      onTap: () {
                        Get.defaultDialog(
                          barrierDismissible: false,
                          middleText: 'Are you sure you want to logout',
                          backgroundColor: Colors.white,
                          buttonColor: Colors.red,
                          title: 'Logout',
                          // content: Card(
                          //   color: Colors.white,
                          //   elevation: 40,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Text('Are you sure you want to logout'),
                          //   ),
                          // ),

                          onConfirm: () {
                            Get.offAll(() => const LoginPage(),
                                transition: Transition.leftToRight);
                          },
                          onCancel: () {
                            Get.back();
                          },
                          // actions: [],
                          // onCancel: () {},
                          // onConfirm: () {},
                        );
                        // UserPreferences().removeUser();
                      },
                    ),
                  ],
                ),
              ),
              appBar: AppBar(
                bottom: _selectedIndex.value == 1
                    ? const TabBar(
                        unselectedLabelColor: Colors.white30,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        labelColor: Colors.white,
                        tabs: [
                          Tab(text: 'Current Contests'),
                          Tab(text: 'Contest History'),
                        ],
                      )
                    : null,
                flexibleSpace: Container(
                  decoration:
                      const BoxDecoration(gradient: MyColors.appbargradient),
                ),
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
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

                title: const Text(
                  'Apna Cricket',
                  style: TextStyle(color: Colors.white),
                ),
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
                        icon: Icon(Icons.emoji_events_outlined),
                        label: 'My Contest'),
                    // NavigationDestination(
                    //     icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
                    NavigationDestination(
                        icon: Icon(Icons.more_horiz_outlined), label: 'More'),
                  ]),
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
