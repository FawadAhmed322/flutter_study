import 'package:flutter/material.dart';

class VoicePage extends StatelessWidget {
  const VoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Activation'),
      ),
      body: Container(
        child: Center(
          child: Text('Voice Activated'),
        ),
      ),
    );
  }
}
