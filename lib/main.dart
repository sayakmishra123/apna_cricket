import 'package:apna_cricket/api/allapifetch.dart';
import 'package:apna_cricket/colors/mycolor.dart';
import 'package:apna_cricket/dashboard.dart';
import 'package:apna_cricket/login/login.dart';
import 'package:apna_cricket/model/allmodelclass.dart';
import 'package:apna_cricket/pages/captannchoose/captainchoose.dart';
import 'package:apna_cricket/pages/contextdeatils.dart';
// import 'package:apna_cricket/pages/mileshistory/mileshistory.dart';
import 'package:apna_cricket/pages/playerlist.dart';
import 'package:apna_cricket/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  User? datahas;
  @override
  void initState() {
    print(DateTime.now());
    getdata().whenComplete(() => null);
    super.initState();
  }

  String data = '';
  Future getdata() async {
    datahas = await UserPreferences().getUser();
    setState(() {});
    // setState(() {
    // setState(() {});
    // print();
    // data = datahas!.userEmail;
    print('has data?');
    // });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apna Crikcet',
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme().copyWith(
          bodyMedium: GoogleFonts.josefinSans(textStyle: textTheme.bodyMedium),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.thirty),
        useMaterial3: true,
      ),
      home: datahas != null ? const () : const LoginPage(),
    );
  }
}
