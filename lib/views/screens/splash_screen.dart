import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../appWrite/authController.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

   final auth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Splash Screen"),
          SizedBox(height: 40),
          LinearProgressIndicator(),
        ],
      ),
    );
  }
}
