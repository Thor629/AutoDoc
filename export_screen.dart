// ... imports
import 'package:flutter/material.dart';

import '../ generate_excel.dart';
import '../pdf_generator.dart & excel_generator.dart';
import '../project_data.dart';

class ExportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProjectData data = ModalRoute.of(context)!.settings.arguments as ProjectData;
    return Scaffold(
      appBar: AppBar(title: Text('Export')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await generatePdf(data);
              // Show success dialog/snackbar
            },
            child: Text('Export as PDF'),
          ),
          ElevatedButton(
            onPressed: () async {
              await generateExcel(data);
              // Show success dialog/snackbar
            },
            child: Text('Export as Excel'),
          ),
        ],
      ),
    );
  }
}