import 'dart:convert';

import 'package:apna_cricket/dashboard.dart';
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
    Get.to(() => const DashBoard());
  } else {
    Get.back();
  }
}
// https://apnacricket.dthlms.in/LoginRegister/Register?UserName=sarojma123@123gmail.com&UserEmail=samaroj@123gmail.com&DeviceId=100&UserPassword=Saroj@123&UserMobileNo=091987654321&Address=kolkata&State=WB&Country=india&Pincode=7012345&FranchiseId=1

Future signUpApi(
  BuildContext context,
  String username,
  String userEmail,
  String password,
  String userMobileNo,
  String address,
  String state,
  String country,
  String pincode,
) async {
  showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      });
  try {
    Map data = {
      'UserName': username.toString(),
      'UserEmail': userEmail,
      'DeviceId': '1',
      'UserPassword': password,
      'UserMobileNo': userMobileNo,
      'Address': address,
      'State': state,
      'Country': country,
      'Pincode': pincode,
      'FranchiseId': '1'
    };

    var res = await http.post(
        Uri.https('apnacricket.dthlms.in', '/LoginRegister/Register'),
        body: data);
    var jsondata = jsonDecode(res.body);
    print(data);
    print(res.body);
    print(res.statusCode);
    if (jsondata['Result'] == true && res.statusCode == 200) {
      Get.back();
      Get.to(() => const DashBoard());
    } else {
      Get.back();
    }
  } catch (e) {
    Get.back();
    print(e);
  }
}
