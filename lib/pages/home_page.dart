import 'package:flutter/material.dart';

import 'package:flutter_study/pages/pdf_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfPage(),
                  ),
                );
              },
              child: Text('Data List App'),
            )
          ],
        ),
      ),
    );
  }
}
