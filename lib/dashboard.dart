import 'package:apna_cricket/pages/homepage.dart';
import 'package:apna_cricket/pages/morepage.dart';
import 'package:apna_cricket/pages/mycontest.dart';
import 'package:apna_cricket/pages/profilepage.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

    int _selectedIndex = 0;
List<Widget> pages = [
  const HomePage(),
  const MyContest(),
  const ProfilePage(),
  const MorePage(),

]; 
 _handleIndexChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        title: const Text('Apna Cricket'),
      ),
      body: Center(
        child: pages[_selectedIndex],
      ),
bottomNavigationBar: NavigationBar(
        onDestinationSelected: _handleIndexChange,
        selectedIndex: _selectedIndex,
        shadowColor: Colors.cyan,
        backgroundColor: Colors.transparent,
        height: 80,
        elevation: 0,
        // indicatorColor: const Color.fromARGB(255, 53, 48, 48).withOpacity(0.1),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.emoji_events_outlined), label: 'My Contest'),
          NavigationDestination(
              icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
               NavigationDestination(
              icon: Icon(Icons.more_horiz_outlined), label: 'More'),
        ]),
    );
  }
}