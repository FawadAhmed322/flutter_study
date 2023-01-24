import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

class DataList extends StatefulWidget {
  DataList({super.key, required this.title});
  final title;
  @override
  State<DataList> createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  final ref = FirebaseDatabase.instance.ref();
  late final imageRef;
  List<String> names = [];

  @override
  void initState() {
    _activateListeners();
  }

  void _activateListeners() {
    // ref.child('images').onValue.listen((DatabaseEvent event) {
    //   final String name = event.snapshot.value;
    // });
    ref.child('images').onValue.listen((DatabaseEvent event) {
      // final List<Object?> = event.snapshot.children.toList();
      setState(() {
        names = event.snapshot.children
            .toList()
            .map(
              (e) => e.child('name').value as String,
            )
            .toList();
      });
      print(names);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: names.map((name) => Text(name)).toList(),
        ),
      ),
    );
  }
}
