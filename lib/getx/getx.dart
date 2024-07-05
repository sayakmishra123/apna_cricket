import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class Getx extends GetxController {
  RxBool loginvisible = false.obs;
  RxInt add = 0.obs;
  RxBool signupvisible = false.obs;
  RxList mileshistory = [].obs;
  RxInt captainindexvalue = 1000.obs;
  RxInt vicecaptainindexvalue = 1000.obs;
  RxString captainchoose = 'Captain gets'.obs;
  RxString vicecaptainchoose = 'Vice Captain gets'.obs;
  RxList<Player> bat = <Player>[].obs;
  RxList<Player> blow = <Player>[].obs;
  RxList<Player> ar = <Player>[].obs;
  RxList<Player> wk = <Player>[].obs;
  RxList<AllContest> allcontext = <AllContest>[].obs;
  RxList<AllTournament> tournamentList = <AllTournament>[].obs;
  RxList<CurrentContest> currentcontext = <CurrentContest>[].obs;
  RxList<Player> selectedplayer = <Player>[].obs;
  // RxList<CurrentContest> currentcontext = <CurrentContest>[].obs;
}

class SelectionControllerWk extends GetxController {
  Getx getx = Get.put(Getx());
  RxList selectedIndices = <int>[].obs;

  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
      getx.add--;
      getx.selectedplayer.remove(getx.wk[index]);
    } else {
      if (getx.add.value < 22) {
        selectedIndices.add(index);
        getx.add++;
        // if (selectedIndices.contains(index)) {
        getx.selectedplayer.add(getx.wk[index]);
        // } else {

        // }
      }
    }
  }
}

class SelectionControllerBlow extends GetxController {
  Getx getx = Get.put(Getx());
  RxList selectedIndices = <int>[].obs;

  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
      getx.add--;
      getx.selectedplayer.remove(getx.wk[index]);
    } else {
      if (getx.add.value < 22) {
        selectedIndices.add(index);
        getx.add++;
        getx.selectedplayer.add(getx.wk[index]);
      }
    }
  }
}

class SelectionControllerBat extends GetxController {
  Getx getx = Get.put(Getx());
  RxList selectedIndices = <int>[].obs;

  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
      getx.add--;
      getx.selectedplayer.remove(getx.wk[index]);
    } else {
      if (getx.add.value < 22) {
        selectedIndices.add(index);
        getx.add++;
        getx.selectedplayer.add(getx.wk[index]);
      }
    }
  }
}

class SelectionControllerAr extends GetxController {
  Getx getx = Get.put(Getx());
  RxList selectedIndices = <int>[].obs;

  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
      getx.add--;
      getx.selectedplayer.remove(getx.wk[index]);
    } else {
      if (getx.add.value < 22) {
        selectedIndices.add(index);
        getx.add++;
        getx.selectedplayer.add(getx.wk[index]);
      }
    }
  }
}
