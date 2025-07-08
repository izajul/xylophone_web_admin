import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;

import '../../controller/authController.dart';
import '../../controller/song_list_controller.dart';
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
          builder: (context, c) => Text("Hi ${c.data?.name}!"),
        ),
        centerTitle: true,
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
        // final list = _songController.songs;
        final list = List.generate(17, (idx) => "Title $idx");
        if (_songController.isLoading.value) {
          // return Center(child: CircularProgressIndicator());
        }

        if (list.isEmpty) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("No songs found"),

                SizedBox(height: 40),
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
          padding: EdgeInsets.all(16),
          crossAxisCount: 5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: List.generate(
            list.length,
            (index) => InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    Image.network(
                      "https://plus.unsplash.com/premium_photo-1666901328734-3c6eb9b6b979?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwaW1hZ2VzfGVufDB8fDB8fHww",
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ColoredBox(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: double.infinity),
                              Text(
                                "Song Title Will Goes here",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Language: English"),
                              Text("Mistake Count: 15 Mistakes"),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.edit),
                                  SizedBox(width: 8),
                                  Text("Edit"),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.delete),
                                  SizedBox(width: 8),
                                  Text("Delete"),
                                ],
                              ),
                            ),
                          ];
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
