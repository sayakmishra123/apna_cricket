import 'package:apna_cricket/getx/getx.dart';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Blow extends StatefulWidget {
  const Blow({super.key});

  @override
  State<Blow> createState() => _BlowState();
}

class _BlowState extends State<Blow> {
  final SelectionControllerBlow controller = Get.put(SelectionControllerBlow());
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
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            bool isSelected = controller.selectedIndices.contains(index);

            return BannerListTile(
              bannerColor: Colors.red,
              // bannerTextColor: Colors.,
              bannerText: l[index],
              backgroundColor: isSelected
                  ? Colors.lightBlueAccent.withOpacity(0.3)
                  : Colors.transparent,
              onTap: () {
                controller.toggleSelection(index);
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
                'Data',
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
          }),
    );
  }
}
