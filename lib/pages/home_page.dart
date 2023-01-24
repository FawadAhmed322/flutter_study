import 'package:flutter/material.dart';

import 'package:flutter_study/pages/data_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataList(title: 'Data List'),
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
