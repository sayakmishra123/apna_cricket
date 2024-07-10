import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Blow extends StatefulWidget {
  MatchDetails match;
  Blow(this.match, {super.key});

  @override
  State<Blow> createState() => _BlowState();
}

class _BlowState extends State<Blow> {
  final SelectionControllerBlow controller = Get.put(SelectionControllerBlow());

  Getx getx = Get.put(Getx());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => getx.bat.isNotEmpty
            ? ListView.builder(
                itemCount: getx.blow.length,
                itemBuilder: (context, index) {
                  bool isSelected = controller.selectedIndices.contains(index);

                  return Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.3))),
                    child: BannerListTile(
                      showBanner: false,
                      bannerColor: Colors.red,
                      // bannerTextColor: Colors.,

                      backgroundColor: isSelected
                          ? Colors.amber.withOpacity(0.2)
                          : Colors.transparent,
                      onTap: () {
                        controller.toggleSelection(index, getx.blow[index],
                            widget.match.numberOfPlayers);
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
                        getx.blow[index].playerName,
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
                    ),
                  );
                })
            : Container(),
      ),
    );
  }
}
