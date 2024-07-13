import 'dart:async';

import 'package:apna_cricket/api/allapifetch.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class ExcelSheetPage extends StatefulWidget {
  const ExcelSheetPage({super.key});

  @override
  State<ExcelSheetPage> createState() => _ExcelSheetPageState();
}

class _ExcelSheetPageState extends State<ExcelSheetPage> {
  Future<void> createExcel() async {
    Excel excel = Excel.createExcel(); // Create an Excel object

    // Add a sheet
    var sheet = excel['Sheet1'];

// ,['Name', 'Age', 'Email'];
    // Add header row
    sheet.appendRow([
      const TextCellValue(
        'Name',
      ),
      TextCellValue('Age'),
      TextCellValue('Email')
    ]);
    sheet.setDefaultColumnWidth();
    // Add data rows
    sheet.appendRow([
      TextCellValue('John Doe'),
      TextCellValue('50'),
      TextCellValue('john.doe@example.com')
    ]);
    sheet.appendRow([
      TextCellValue('Jane Smith'),
      TextCellValue('30'),
      TextCellValue('jane.smith@example.com')
    ]);
    setState(() {});

    // Save the Excel file
    var dir =
        await getDownloadsDirectory(); // Get the device's external storage directory
    var file = File('${dir?.path}/example1.xlsx'); // Specify the file path
    excel.sheets.clear();
    file.writeAsBytes(excel.encode()!.toList()); // Write the Excel file
    print('Excel file created at: ${file.path}');

    setState(() {});
  }

  @override
  void initState() {
    // Timer.periodic(Duration(milliseconds: 500), (timer) {
    //   setState(() {
    //     contestListApi(context);
    //   });
    //   print('sss');
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextButton(
          onPressed: () {
            createExcel();
          },
          child: Text('Excel')),
    );
  }
}
