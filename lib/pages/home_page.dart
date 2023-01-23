import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
