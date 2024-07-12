import 'package:apna_cricket/getx/getx.dart';
import 'package:get/get.dart';

class DependencyInjection extends GetxController{
  static void init(){
    Get.put<NetworkController>(NetworkController(),permanent: true);
  }
}