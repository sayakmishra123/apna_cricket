import 'dart:async';

import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:apna_cricket/pages/nodata/nodata.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

class Getx extends GetxController {
  RxBool loginvisible = true.obs;
  RxInt add = 0.obs;
  RxBool isColor = false.obs;
  RxBool signupvisible = true.obs;
  RxBool oldPasswordVisible = true.obs;
  RxBool newPasswordVisible = true.obs;
  RxBool confirmNewPasswordVisible = true.obs;
  RxList mileshistory = [].obs;
  RxInt captainindexvalue = RxInt(-1);
  RxInt vicecaptainindexvalue = RxInt(-1);
  RxString captainchoose = 'Captain gets'.obs;
  RxString vicecaptainchoose = 'Vice Captain gets'.obs;
  RxList<Player> bat = <Player>[].obs;
  RxList<Player> blow = <Player>[].obs;
  RxList<Player> ar = <Player>[].obs;
  RxList<Player> wk = <Player>[].obs;
  RxList<AllContest> allcontext = <AllContest>[].obs;
  RxList<AllTournament> tournamentList = <AllTournament>[].obs;
  RxList<CurrentContest> currentcontext = <CurrentContest>[].obs;
  RxList<ContestHistory> contesthistory = <ContestHistory>[].obs;
  RxList<Player> selectedplayer = <Player>[].obs;
  RxList<MatchDetails> matchdetails = <MatchDetails>[].obs;
  RxBool loaderoff = true.obs;
  // RxList<CurrentContest> currentcontext = <CurrentContest>[].obs;
}

class SelectionControllerWk extends GetxController {
  Getx getx = Get.put(Getx());
  RxList selectedIndices = <int>[].obs;

  void toggleSelection(
    int index,
    Player wk,
    int numberOfPlayers,
  ) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
      getx.add--;
      getx.selectedplayer.remove(wk);
    } else {
      if (getx.add.value < numberOfPlayers) {
        selectedIndices.add(index);
        getx.add++;
        // if (selectedIndices.contains(index)) {
        getx.selectedplayer.add(wk);
        // } else {

        // }
      }
    }
  }
}

class SelectionControllerBlow extends GetxController {
  Getx getx = Get.put(Getx());
  RxList selectedIndices = <int>[].obs;

  void toggleSelection(
    int index,
    Player blow,
    int numberOfPlayers,
  ) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
      getx.add--;
      getx.selectedplayer.remove(blow);
    } else {
      if (getx.add.value < numberOfPlayers) {
        selectedIndices.add(index);
        getx.add++;
        getx.selectedplayer.add(blow);
      }
    }
  }
}

class SelectionControllerBat extends GetxController {
  Getx getx = Get.put(Getx());
  RxList selectedIndices = <int>[].obs;

  void toggleSelection(
    int index,
    Player bat,
    int numberOfPlayers,
  ) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
      getx.add--;
      getx.selectedplayer.remove(bat);
    } else {
      if (getx.add.value < numberOfPlayers) {
        selectedIndices.add(index);
        getx.add++;
        getx.selectedplayer.add(bat);
      }
    }
  }
}

class SelectionControllerAr extends GetxController {
  Getx getx = Get.put(Getx());
  RxList selectedIndices = <int>[].obs;

  void toggleSelection(
    int index,
    Player ar,
    int numberOfPlayers,
  ) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
      getx.add--;
      getx.selectedplayer.remove(ar);
    } else {
      if (getx.add.value < numberOfPlayers) {
        selectedIndices.add(index);
        getx.add++;
        getx.selectedplayer.add(ar);
      }
    }
  }
}

class NetworkController extends GetxController {
  RxBool isdialog = false.obs;
  RxList<ConnectivityResult> _connectionStatus = [ConnectivityResult.none].obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  @override
  void onInit() {
    super.onInit();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(
        'Couldn\'t check connectivity status',
      );
      return;
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus.value = result;

    if (_connectionStatus.value.contains(ConnectivityResult.none)) {
      if (isdialog.value == false) {}
    }

    Get.rawSnackbar(
      duration: const Duration(seconds: 1),
      // backgroundColor: ,
      overlayBlur: 5,
      barBlur: 5,
      title: 'connection',
      message: _connectionStatus.toString(),
    );
  }
}
