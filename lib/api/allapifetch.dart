import 'dart:convert';

import 'package:apna_cricket/dashboard.dart';
import 'package:apna_cricket/getx/getx.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  String _userKey = "user_key";
  late SharedPreferences prefs;
  // Save user data
  Future<void> saveUser(User user) async {
    prefs = await SharedPreferences.getInstance();
    String userJson = json.encode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  // Retrieve user data
  Future<User?> getUser() async {
    prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(_userKey) ?? 'no';
    print(userJson);

    if (userJson != 'no') {
      Map<String, dynamic> userMap = json.decode(userJson);
      print(userMap['UserId']);
      print('shared');
      return User.fromJson(userMap);
    }
    return null;
  }

  // Remove user data
  Future<void> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString(_userKey) ?? 'no data');
    await prefs.clear();
    // Get.to(page)
  }
}

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
    Map<String, dynamic> jsonMap = jsondata['Data'][0];
    User user = User.fromJson(jsonMap);
    print(user.userId);
    await UserPreferences().saveUser(user);
    Get.to(() => const DashBoard());
  } else {
    Get.back();
    Get.rawSnackbar(
        duration: const Duration(seconds: 1),
        // backgroundColor: ,
        overlayBlur: 5,
        barBlur: 5,
        title: 'Invalid login',
        message: jsondata['Data'],
        snackStyle: SnackStyle.GROUNDED);
  }
}

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
      Get.rawSnackbar(
          duration: const Duration(seconds: 1),
          // backgroundColor: ,
          overlayBlur: 5,
          barBlur: 5,
          title: 'Invalid login',
          message: jsondata['Data'],
          snackStyle: SnackStyle.GROUNDED);
    }
  } catch (e) {
    Get.back();

    print(e);
  }
}

Future contestListApi(BuildContext context) async {
  Getx getx = Get.put(Getx());
  showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      });
  var res = await http.get(
    Uri.https('apnacricket.dthlms.in', '/contesttype/getContestType'),
  );
  var jsondata = jsonDecode(res.body);
  print(res.body);
  print(res.statusCode);
  if (jsondata['Result'] == true && res.statusCode == 200) {
    List jsonList1 = jsondata['Data'];
    getx.allcontext.value =
        jsonList1.map((json) => AllContest.fromJson(json)).toList();
    Get.back();
    tournamentListApi(context, getx.allcontext[0].contestTypeId.toString());
    // Get.to(() => const DashBoard());
  } else {
    Get.back();
    Get.rawSnackbar(
        duration: const Duration(seconds: 1),
        // backgroundColor: ,
        overlayBlur: 5,
        barBlur: 5,
        title: 'Invalid login',
        message: jsondata['Data'],
        snackStyle: SnackStyle.GROUNDED);
  }
}

Future milesListApi(BuildContext context) async {
  Getx getx = Get.put(Getx());
  showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      });
  Map data = {'userid': '20'};
  var res = await http.post(
      Uri.https('apnacricket.dthlms.in', '/Miles/MilesHistory'),
      body: data);
  var jsondata = jsonDecode(res.body);
  print(res.body);
  print(res.statusCode);
  if (jsondata['Result'] == true && res.statusCode == 200) {
    // Get.back();
    for (int i = 0; i < jsondata['Data'].length; i++) {
      getx.mileshistory.add(jsondata['Data'][i]);
    }
// getx.mileshistory.
    // Get.to(() => const DashBoard());
  } else {
    Get.back();
    Get.rawSnackbar(
        duration: const Duration(seconds: 1),
        // backgroundColor: ,
        overlayBlur: 5,
        barBlur: 5,
        title: 'Error',
        message: jsondata['Data'],
        snackStyle: SnackStyle.GROUNDED);
  }
}

Future singleteamplayersListApi(
    BuildContext context, MatchDetails match) async {
  Getx getx = Get.put(Getx());
  print('object');
  try {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    Map<String, String> data = {
      'Team1Id': match.team1Id.toString(),
      'Team2Id': match.team2Id.toString()
    };

    final Uri uri =
        Uri.https('apnacricket.dthlms.in', '/teamplayers/getTeamPlayerByTeamId')
            .replace(queryParameters: data);
    var res = await http.get(
      uri,
    );

    var jsondata = jsonDecode(res.body);
    if (jsondata['Result'] == true && res.statusCode == 200) {
      List jsonList1 = jsondata['Batsmans'];
      getx.bat.value = jsonList1.map((json) => Player.fromJson(json)).toList();
      for (var player in getx.bat) {
        print('Player Name: ${player.playerName}, Team: ${player.teamName}');
      }
      List jsonList2 = jsondata['Bowlers'];
      getx.blow.value = jsonList2.map((json) => Player.fromJson(json)).toList();
      for (var player in getx.blow) {
        print('Player Name: ${player.playerName}, Team: ${player.teamName}');
      }

      List jsonList3 = jsondata['WecketKeepers'];
      getx.wk.value = jsonList3.map((json) => Player.fromJson(json)).toList();
      for (var player in getx.wk) {
        print('Player Name: ${player.playerName}, Team: ${player.teamName}');
      }
      List jsonList4 = jsondata['Allrounders'];
      getx.ar.value = jsonList4.map((json) => Player.fromJson(json)).toList();
      for (var player in getx.ar) {
        print('Player Name: ${player.playerName}, Team: ${player.teamName}');
      }

      Get.back();
    } else {
      Get.back();
      Get.rawSnackbar(
          duration: const Duration(seconds: 1),
          // backgroundColor: ,
          overlayBlur: 5,
          barBlur: 5,
          title: 'Invalid login',
          message: jsondata['Data'],
          snackStyle: SnackStyle.GROUNDED);
    }
  } catch (e) {
    Get.back();
    print(e);
  }
}

Future allteamplayersListApi(BuildContext context, MatchDetails match) async {
  Getx getx = Get.put(Getx());
  print('object');
  try {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    Map<String, String> data = {'tournamentid': match.tournamentId.toString()};

    final Uri uri =
        Uri.https('apnacricket.dthlms.in', '/TeamPlayers/getTeamPlayer')
            .replace(queryParameters: data);
    var res = await http.get(
      uri,
    );

    var jsondata = jsonDecode(res.body);
    print(data);
    print(jsondata);
    if (jsondata['Result'] == true && res.statusCode == 200) {
      List jsonList1 = jsondata['Batsmans'];
      getx.bat.value = jsonList1.map((json) => Player.fromJson(json)).toList();

      List jsonList2 = jsondata['Bowlers'];
      getx.blow.value = jsonList2.map((json) => Player.fromJson(json)).toList();

      List jsonList3 = jsondata['WecketKeepers'];
      getx.wk.value = jsonList3.map((json) => Player.fromJson(json)).toList();

      List jsonList4 = jsondata['Allrounders'];
      getx.ar.value = jsonList4.map((json) => Player.fromJson(json)).toList();

      Get.back();
    } else {
      Get.back();
      Get.rawSnackbar(
          duration: const Duration(seconds: 1),
          // backgroundColor: ,
          overlayBlur: 5,
          barBlur: 5,
          title: 'Invalid login',
          message: jsondata['Data'],
          snackStyle: SnackStyle.GROUNDED);
    }
  } catch (e) {
    Get.back();
    print(e);
  }
}

Future tournamentListApi(BuildContext context, String contestTypeId) async {
  print(contestTypeId);
  Getx getx = Get.put(Getx());
  // showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const Center(child: CircularProgressIndicator());
  //     });
  Map<String, dynamic> data = {'ContestTypeId': contestTypeId};
  var res = await http.get(
    Uri.https('apnacricket.dthlms.in', '/Tournament/getTOUrnament')
        // https://apnacricket.dthlms.in/Tournament/getTOUrnament?contestTypeId=2
        .replace(queryParameters: data),
  );
  var jsondata = jsonDecode(res.body);
  print(res.body);
  print(res.statusCode);
  if (jsondata['Result'] == true && res.statusCode == 200) {
    // Get.back();
    List jsonList1 = jsondata['AllTournament'] ?? [];
    //  List jsonList2 = jsondata['UserTournament'];
    getx.tournamentList.value =
        jsonList1.map((json) => AllTournament.fromJson(json)).toList();
    for (var player in getx.tournamentList) {
      print(player.contestTypeId);
    }

// getx.mileshistory.
    // Get.to(() => const DashBoard());
  } else {
    // Get.back();
    Get.rawSnackbar(
        duration: const Duration(seconds: 1),
        // backgroundColor: ,
        overlayBlur: 5,
        barBlur: 5,
        title: 'Invalid login',
        message: jsondata['Data'],
        snackStyle: SnackStyle.GROUNDED);
  }
}

Future allmatchListApi(BuildContext context, String contestTypeId,
    String userid, String tournamentId) async {
  print(contestTypeId);
  Getx getx = Get.put(Getx());

  Map<String, dynamic> data = {
    'ContestTypeId': contestTypeId,
    // 'Userid': userid,
    'TournamentId': tournamentId
  };
  var res = await http.get(
    Uri.https('apnacricket.dthlms.in', '/Matches/getMatchALLvsALL')
        .replace(queryParameters: data),
  );
  var jsondata = jsonDecode(res.body);
  print(res.body);
  print(res.statusCode);
  if (jsondata['Result'] == true && res.statusCode == 200) {
    List jsonList = jsondata['Data'] ?? [];
    getx.matchdetails.value =
        jsonList.map((e) => MatchDetails.fromJson(e)).toList();
  } else {
    Get.rawSnackbar(
        duration: const Duration(seconds: 1),
        // backgroundColor: ,
        overlayBlur: 5,
        barBlur: 5,
        title: 'Error',
        message: jsondata['Data'],
        snackStyle: SnackStyle.GROUNDED);
  }
}

Future singlematchListApi(BuildContext context, String contestTypeId,
    String userid, String tournamentId) async {
  print(contestTypeId);
  Getx getx = Get.put(Getx());

  Map<String, dynamic> data = {
    'ContestTypeId': contestTypeId,
    // 'Userid': userid,
    'TournamentId': tournamentId
  };
  var res = await http.get(
    Uri.https('apnacricket.dthlms.in', '/Matches/getMatchSingle')
        .replace(queryParameters: data),
  );
  var jsondata = jsonDecode(res.body);
  print(res.body);
  print(res.statusCode);
  if (jsondata['Result'] == true && res.statusCode == 200) {
    List jsonList = jsondata['Data'] ?? [];
    getx.matchdetails.value =
        jsonList.map((e) => MatchDetails.fromJson(e)).toList();
    // Get.back();
  } else {
    // Get.back();
    Get.rawSnackbar(
        duration: const Duration(seconds: 1),
        // backgroundColor: ,
        overlayBlur: 5,
        barBlur: 5,
        title: 'Invalid login',
        message: jsondata['Data'],
        snackStyle: SnackStyle.GROUNDED);
  }
}

Future currentcontextListApi(BuildContext context, String userid) async {
  // print(contestTypeId);
  Getx getx = Get.put(Getx());
  User? user = await UserPreferences().getUser();
  try {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return const Center(child: CircularProgressIndicator());
    //     });
    Map<String, dynamic> data = {'userid': user?.userId.toString()};
    var res = await http.get(
      Uri.https('apnacricket.dthlms.in', '/ContestType/getMyContestType')
          .replace(queryParameters: data),
    );
    var jsondata = jsonDecode(res.body);
    print(res.body);
    print(res.statusCode);
    if (jsondata['Result'] == true && res.statusCode == 200) {
      List jsonList1 = jsondata['Data'] ?? [];
      //  List jsonList2 = jsondata['UserTournament'];
      getx.currentcontext.value =
          jsonList1.map((json) => CurrentContest.fromJson(json)).toList();
    } else {
      // Get.back();
      Get.rawSnackbar(
          duration: const Duration(seconds: 1),
          // backgroundColor: ,
          overlayBlur: 5,
          barBlur: 5,
          title: 'Invalid login',
          message: jsondata['Data'],
          snackStyle: SnackStyle.GROUNDED);
    }
  } catch (E) {
    print(E);
  }
}

Future teamSaveListApi(BuildContext context, String playerID, String contestId,
    String userid, String match, String captain, String viceCaptain) async {
  try {
    Getx getx = Get.put(Getx());

    Map<String, dynamic> data = {
      'PlayerID': playerID,
      'ContestId': contestId,
      'UserId': userid,
      'MatchId': match,
      'Captain': captain,
      'ViceCaptain': viceCaptain
    };
    // print(data);
    var res = await http.get(
      Uri.https('apnacricket.dthlms.in', '/Team/CreateTeam')
          .replace(queryParameters: data),
    );
    print(res.body);
    var jsondata = jsonDecode(res.body);
    // print(jsondata);
    if (jsondata['Result'] == true && res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

// ContestHistory by shubha
Future contestHistoryListApi(BuildContext context, String userid) async {
  // print(contestTypeId);
  Getx getx = Get.put(Getx());
  // showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const Center(child: CircularProgressIndicator());
  //     });
  Map<String, dynamic> data = {'userid': userid};
  var res = await http.get(
    Uri.https('apnacricket.dthlms.in', '/contestType/getMyContestHistory')
// https://apnacricket.dthlms.in/contestType/getMyContestHistory?userid=20
        .replace(queryParameters: data),
  );
  var jsondata = jsonDecode(res.body);
  // print(res.body);
  // print(res.statusCode);
  if (jsondata['Result'] == true && res.statusCode == 200) {
    List jsonList1 = jsondata['Data'] ?? [];
    //  List jsonList2 = jsondata['UserTournament'];
    getx.contesthistory.value =
        jsonList1.map((json) => ContestHistory.fromJson(json)).toList();
  } else {
    Get.back();
    Get.rawSnackbar(
        duration: const Duration(seconds: 1),
        // backgroundColor: ,
        overlayBlur: 5,
        barBlur: 5,
        title: 'Invalid login',
        message: jsondata['Data'],
        snackStyle: SnackStyle.GROUNDED);
  }
}

Future changepasswordApi(
    BuildContext context, String userid, String newpassword) async {
  showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      });

  Map<String, dynamic> data = {'userId': userid, 'newPassword': newpassword};
  Getx getx = Get.put(Getx());

  var res = await http.get(
      Uri.https('apnacricket.dthlms.in', '/LoginRegister/ChangePassword')
          .replace(queryParameters: data));

  var jsondata = jsonDecode(res.body);
  if (res.statusCode == 200) {
    if (jsondata["Result"] == true) {
      Get.back();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const Text('Your password has been changed successfully!'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.back();
                },
              ),
            ],
          );
        },
      );
    }
  } else {
    Get.back();
    Get.rawSnackbar(
        duration: const Duration(seconds: 1),
        overlayBlur: 5,
        barBlur: 5,
        title: 'Invalid login',
        message: jsondata["Result"],
        snackStyle: SnackStyle.GROUNDED);
  }
}
