import 'package:apna_cricket/getx/getx.dart';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Wk extends StatefulWidget {
  const Wk({super.key});

  @override
  State<Wk> createState() => WkState();
}

class WkState extends State<Wk> {
  final SelectionControllerWk controller = Get.put(SelectionControllerWk());
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
    return Obx(
      () => Scaffold(
        body: getx.wk.isNotEmpty
            ? ListView.builder(
                itemCount: getx.wk.length,
                itemBuilder: (context, index) {
                  bool isSelected = controller.selectedIndices.contains(index);

                  return Container(
                    // decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                    child: BannerListTile(
                      borderSide: BorderSide.none,
                      bannerColor: Colors.red,
                      // bannerTextColor: Colors.,
                      bannerText: l[index],
                      backgroundColor: isSelected
                          ? Colors.amber.withOpacity(0.2)
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
                        getx.wk[index].playerName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      subtitle: Text(
                        'Self by 9.01%',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      trailing: Icon(
                        isSelected ? Icons.remove : Icons.add,
                        color: isSelected ? Colors.red : Colors.green,
                      ),
                    ),
                  );
                })
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
