import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Bat extends StatefulWidget {
  MatchDetails match;
  Bat(this.match, {super.key});

  @override
  State<Bat> createState() => _BatState();
}

class _BatState extends State<Bat> {
  final SelectionControllerBat controllerBat =
      Get.put(SelectionControllerBat());
  // RxList<int> selectedIndices = <int>[].obs;

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

                  return Opacity(
                     opacity: !isSelected
                                ? getx.add.value != widget.match.numberOfPlayers
                                    ? 1.0
                                    : 0.5
                                : 1.0,
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(width: 0.3))),
                      child: BannerListTile(
                        showBanner: false,
                        bannerColor: Colors.red,
                        // bannerTextColor: Colors.,
                    
                        backgroundColor: isSelected
                            ? Colors.amber.withOpacity(0.2)
                            : Colors.transparent,
                            
                      onTap: !isSelected
                                  ? getx.add.value != widget.match.numberOfPlayers
                                      ? () {
                          controllerBat.toggleSelection(index, getx.bat[index],
                              widget.match.numberOfPlayers);
                          setState(() {});
                        }: null
                        :() {
                          controllerBat.toggleSelection(index, getx.bat[index],
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
                          getx.bat[index].playerName,
                          style:  TextStyle(fontWeight: FontWeight.bold,
                           
                          ),
                        ),
                        subtitle:  Text(
                          'Self by 9.01%',
                          style: TextStyle(
                            color: Colors.black38
                          ),
                        ),
                       trailing: Icon(
                          isSelected ? Icons.remove : Icons.add,
                          color: !isSelected
                              ? getx.add.value != widget.match.numberOfPlayers
                                  ? Colors.green
                                  : Colors.black12
                              : Colors.red,
                        ),
                      ),
                    ),
                  );
                })
            : Container(),
      ),
    );
  }
}
