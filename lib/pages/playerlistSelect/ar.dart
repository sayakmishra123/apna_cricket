import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class Ar extends StatefulWidget {
  MatchDetails match;
  Ar(this.match, {super.key});

  @override
  State<Ar> createState() => _ArState();
}

class _ArState extends State<Ar> {
  final SelectionControllerAr controllerAr = Get.put(SelectionControllerAr());
  // RxList<int> selectedIndices = <int>[].obs;

  Getx getx = Get.put(Getx());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => getx.ar.isNotEmpty
            ? ListView.builder(
                itemCount: getx.ar.length,
                itemBuilder: (context, index) {
                  bool isSelected =
                      controllerAr.selectedIndices.contains(index);

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
                                      ?  () {
                          controllerAr.toggleSelection(index, getx.ar[index],
                              widget.match.numberOfPlayers);
                          setState(() {});
                        }: null
                        : () {
                          controllerAr.toggleSelection(index, getx.ar[index],
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
                          getx.ar[index].playerName,
                          style:  const TextStyle(fontWeight: FontWeight.bold,
                        
                          ),
                        ),
                         subtitle:  const Text(
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
