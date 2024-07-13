import 'dart:ffi';

import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Wk extends StatefulWidget {
  MatchDetails match;
  Wk(this.match, {super.key});

  @override
  State<Wk> createState() => WkState();
}

class WkState extends State<Wk> {
  final SelectionControllerWk controller = Get.put(SelectionControllerWk());

  Getx getx = Get.put(Getx());

  RxBool listVisible = true.obs;
  listVisibleCheck() {
    if (getx.add.value != widget.match.numberOfPlayers) {}
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: getx.wk.isNotEmpty
            ? ListView.builder(
                itemCount: getx.wk.length,
                itemBuilder: (context, index) {
                  bool isSelected = controller.selectedIndices.contains(index);

                  return Opacity(
                    opacity: !isSelected
                                ? getx.add.value != widget.match.numberOfPlayers
                                    ? 1.0
                                    : 0.2
                                : 1.0,
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(width: 0.3))),
                      child: BannerListTile(
                        borderSide: BorderSide.none,
                        bannerColor: Colors.red,
                        // bannerTextColor: Colors.,
                        showBanner: false,
                        backgroundColor:
                       
                                 isSelected
                                    ? Colors.amber.withOpacity(0.1)
                                    : Colors.transparent,
                                
                    
                        onTap: !isSelected
                                  ? getx.add.value != widget.match.numberOfPlayers
                                      ?  () {
                          controller.toggleSelection(index, getx.wk[index],
                              widget.match.numberOfPlayers);
                          setState(() {});
                        }: null
                        : () {
                          controller.toggleSelection(index, getx.wk[index],
                              widget.match.numberOfPlayers);
                          setState(() {});
                        },
                    
                    
                         
                        title: Text(
                          getx.wk[index].playerName,
                          style: TextStyle(
                            
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        subtitle: Text(
                          getx.wk[index].points.toString(),
                          style: const TextStyle(
                               color: Colors.black38,
                              fontSize: 14),
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
