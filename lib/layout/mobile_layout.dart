import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Layout')),
      body: const Center(
        child: Text(
          'Welcome to the Mobile Layout!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
