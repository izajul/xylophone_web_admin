import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../appWrite/authController.dart' show AuthController;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final auth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Xylophone Admin Login"),
      ),
      body: Obx(() {
        final isLoading = auth.isLoading.value;

        if (isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // email input field
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
              controller: auth.emailController,
            ),
            SizedBox(height: 20),
            // password input field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
              controller: auth.passwordController,
            ),
            SizedBox(height: 20),

            // login button
            FilledButton(
              onPressed: () {
                auth.login();
              },
              child: Text("Login"),
            ),
          ],
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
