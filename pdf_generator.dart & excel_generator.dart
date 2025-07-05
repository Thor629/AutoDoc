import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'dart:io';

import 'project_data.dart';

Future<void> generatePdf(ProjectData data) async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        children: [
          pw.Image(pw.MemoryImage(File('assets/images/college_logo.png').readAsBytesSync())),
          pw.Text('Project Report', style: pw.TextStyle(fontSize: 24)),
          // ... Add project details
        ],
      ),
    ),
  );
  final file = File('project_report.pdf');
  await file.writeAsBytes(await pdf.save());
}