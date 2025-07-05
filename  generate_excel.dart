import 'package:excel/excel.dart';
import 'dart:io';

import 'project_data.dart';

Future<void> generateExcel(ProjectData data) async {
  var excel = Excel.createExcel();
  Sheet sheet = excel['Report'];
 // sheet.appendRow(['Project Title', data.title]);
  // ... Add other fields
  var fileBytes = excel.save();
  File('project_report.xlsx')
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);
}