import 'package:apna_cricket/getx/getx.dart';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Bat extends StatefulWidget {
  const Bat({super.key});

  @override
  State<Bat> createState() => _BatState();
}

class _BatState extends State<Bat> {
  final SelectionControllerBat controllerBat =
      Get.put(SelectionControllerBat());
  // RxList<int> selectedIndices = <int>[].obs;
  List l = [
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan',
    'India',
    'Pakistan'
  ];
  Getx getx = Get.put(Getx());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => getx.bat.isNotEmpty
            ? ListView.builder(
                itemCount: getx.bat.length,
                itemBuilder: (context, index) {
                  bool isSelected =
                      controllerBat.selectedIndices.contains(index);

                  return BannerListTile(
                    bannerColor: Colors.red,
                    // bannerTextColor: Colors.,
                    bannerText: l[index],
                    backgroundColor: isSelected
                        ? Colors.lightBlueAccent.withOpacity(0.3)
                        : Colors.transparent,
                    onTap: () {
                      controllerBat.toggleSelection(index);
                      setState(() {});
                    },
                    imageContainer: SizedBox(
                      width: 10,
                      height: 10,
                      child: Image.asset(
                        'assets/sixers.png',
                        // width: 10,
                        // height: 10,
                        scale: 10,
                      ),
                    ),
                    title: Text(
                      getx.bat[index].playerName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Self by 9.01%',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(
                      isSelected ? Icons.remove : Icons.add,
                      color: isSelected ? Colors.red : Colors.green,
                    ),
                  );
                })
            : Container(),
      ),
    );
  }
}
