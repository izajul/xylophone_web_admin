import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;

import '../../appWrite/authController.dart';
import '../../appWrite/song_list_controller.dart';
import '../../localPref/session_pref.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final sessionPref = SessionPref();

  final _authController = Get.put(AuthController());

  final _songController = Get.put(SongListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: sessionPref.getUserInfo,
          builder: (context, c) =>
              Text("Hi ${c.data?.name}! Welcome to the Xylophone Admin"),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              await _authController.logout();
              await sessionPref.clear();
              // Get.offAllNamed('/login');
              Get.snackbar('Success', 'Logged out successfully');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() {
        final list = _songController.songs;
        if (_songController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (list.isEmpty) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("No songs found"),

                SizedBox(height: 40,),
                // add button to add new song
                FilledButton(
                  onPressed: () {
                    Get.toNamed("/addSong");
                  },
                  child: Text("Add New Song"),
                ),
              ],
            ),
          );
        }

        return GridView.count(
          crossAxisCount: 4,
          children: List.generate(
            list.length,
            (index) => ListTile(
              title: Text(list[index].data['title']),
              subtitle: Text(list[index].data['artist']),
            ),
          ),
        );
      }),
    );
  }
}
