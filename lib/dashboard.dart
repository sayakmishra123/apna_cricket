import 'package:apna_cricket/pages/homepage.dart';
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
                    color: Colors.red,
                  ),
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
                                    'assets/logo.jpg',
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
                                  'Sayak Mishra',
                                  style: profilestyle,
                                ),
                                Text('Sayak@gmail.com', style: profilestyle),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.attach_money_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Miles History'),
                    ],
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.lock_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Change Password'),
                    ],
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.more_horiz_rounded),
                      SizedBox(
                        width: 20,
                      ),
                      Text('More'),
                    ],
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.logout_rounded),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Log Out'),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.red,
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
        title: Row(
          children: [
            SizedBox(
                height: 60,
                width: 60,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.asset('assets/logo.jpg')))
          ],
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
                icon: Icon(Icons.emoji_events_outlined), label: 'My Contest'),
            // NavigationDestination(
            //     icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
            NavigationDestination(
                icon: Icon(Icons.more_horiz_outlined), label: 'More'),
          ]),
    );
  }
}
