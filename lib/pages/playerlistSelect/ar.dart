import 'package:apna_cricket/getx/getx.dart';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Ar extends StatefulWidget {
  const Ar({super.key});

  @override
  State<Ar> createState() => _ArState();
}

class _ArState extends State<Ar> {
  final SelectionControllerAr controllerAr = Get.put(SelectionControllerAr());
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
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            bool isSelected = controllerAr.selectedIndices.contains(index);

            return BannerListTile(
              bannerColor: Colors.red,
              // bannerTextColor: Colors.,
              bannerText: l[index],
              backgroundColor: isSelected
                  ? Colors.lightBlueAccent.withOpacity(0.3)
                  : Colors.transparent,
              onTap: () {
                controllerAr.toggleSelection(index);
                setState(() {});
              },
              imageContainer: Image.asset('assets/nodp.jpg'),
              title: Text(
                'Data',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Self by 9.01%',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              trailing: Icon(
                Icons.add,
                color: Colors.green,
              ),
            );
          }),
    );
  }
}
