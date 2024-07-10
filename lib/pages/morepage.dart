import 'package:apna_cricket/pages/fantasypointandsystem.dart';
import 'package:apna_cricket/pages/howtoplay.dart';
import 'package:apna_cricket/pages/nodata/nodata.dart';
import 'package:apna_cricket/pages/termandcondition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.1))),
            child: ListTile(
              onTap: () => Get.to(() => FantasyPointSystem(),
                  transition: Transition.leftToRight),
              leading: const Icon(Icons.point_of_sale),
              title: const Text('Fantasy Point System'),
              trailing: IconButton(
                // color: Colors.red,
                onPressed: () {
                  Get.to(() => FantasyPointSystem(),
                      transition: Transition.leftToRight);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.1))),
            child: ListTile(
              onTap: () =>
                  Get.to(() => HowToPlay(), transition: Transition.leftToRight),
              leading: const Icon(Icons.description),
              title: const Text('How to Play'),
              trailing: IconButton(
                // color: Colors.red,
                onPressed: () {
                  Get.to(() => HowToPlay(), transition: Transition.leftToRight);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.1))),
            child: ListTile(
              onTap: () => Get.to(() => TermAndCondition(),
                  transition: Transition.leftToRight),
              leading: const Icon(Icons.terminal),
              title: const Text('Term & Condition'),
              trailing: IconButton(
                // color: Colors.red,
                onPressed: () {
                  Get.to(() => TermAndCondition(),
                      transition: Transition.leftToRight);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ),
            ),
          ),

          NoData(),
        ],
      ),
    );
  }
}
