import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPage extends StatelessWidget {
  PdfPage({super.key, this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
      body: Container(
        child: SfPdfViewer.network(
          'https://firebasestorage.googleapis.com/v0/b/bookapp-3f431.appspot.com/o/books%2F72%2F1674432599365.pdf?alt=media',
        ),
      ),
    );
  }
}
