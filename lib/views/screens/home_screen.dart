import 'package:flutter/material.dart';

import '../../localPref/session_pref.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final sessionPref = SessionPref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: sessionPref.getUserInfo,
          builder: (context, c) => Text("Hi ${c.data?.name}! Welcome to the Xylophone Admin"),
        ),
        centerTitle: true,
      ),
      body: Center(child: Text("Welcome to the Home Screen")),
    );
  }
}
