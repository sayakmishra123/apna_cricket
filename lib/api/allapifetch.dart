import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

Future loginApi(BuildContext context, String username, String password) async {
  showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      });

  Map data = {'name': username, 'password': password, 'DeviceId': '1'};

  var res = await http.post(
      Uri.https(
          'apnacricket.dthlms.in', '/LoginRegister/GetUserByNameAndPassword'),
      body: data);
  var jsondata = jsonDecode(res.body);
  print(res.body);
  print(res.statusCode);
  if (jsondata['Result'] == true && res.statusCode == 200) {
    Get.back();
  } else {
    Get.back();
  }
}
