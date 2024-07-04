import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:get/get.dart';

class Getx extends GetxController {
  RxBool loginvisible = false.obs;
  RxInt add = 0.obs;
  RxBool signupvisible = false.obs;
  RxList mileshistory = [].obs;

  RxList<Player> bat = <Player>[].obs;
  RxList<Player> blow = <Player>[].obs;
  RxList<Player> ar = <Player>[].obs;
  RxList<Player> wk = <Player>[].obs;
  // RxBool isSelected = false.obs;
}

class SelectionControllerWk extends GetxController {
  Getx getx = Get.put(Getx());
  RxList selectedIndices = <int>[].obs;

  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
      getx.add--;
    } else {
      if (getx.add.value < 22) {
        selectedIndices.add(index);
        getx.add++;
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
    } else {
      if (getx.add.value < 22) {
        selectedIndices.add(index);
        getx.add++;
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
    } else {
      if (getx.add.value < 22) {
        selectedIndices.add(index);
        getx.add++;
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
    } else {
      if (getx.add.value < 22) {
        selectedIndices.add(index);
        getx.add++;
      }
    }
  }
}
