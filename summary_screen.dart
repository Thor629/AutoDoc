// ... imports
import 'package:flutter/material.dart';

import '../project_data.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProjectData data = ModalRoute.of(context)!.settings.arguments as ProjectData;
    return Scaffold(
      appBar: AppBar(title: Text('Summary')),
      body: Column(
        children: [
          // Show all collected data in a nice card/list
          // ...
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/export', arguments: data);
            },
            child: Text('Export to PDF/Excel'),
          ),
        ],
      ),
    );
  }
}