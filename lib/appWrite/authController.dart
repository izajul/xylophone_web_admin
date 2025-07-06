import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../localPref/session_pref.dart';
import 'appwrite_service.dart';

class AuthController extends GetxController {
  final appWrite = AppwriteService();

  final sessionPref = SessionPref();

  @override
  void onInit() {
    super.onInit();
    _checkSession();
  }

  Future<void> _checkSession() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    print("checking session");
    final sessionId = await sessionPref.getSessionID;

    print("session id: $sessionId");

    if (sessionId == null) {
      Get.offAllNamed('/login');
      isLoading.value = false;
      return;
    }
    final session = await appWrite.account.getSession(sessionId: sessionId);
    isLoading.value = false;
    // if(session.current)
    Get.offAllNamed('/home');
  }

  Account get account => appWrite.account;
  final isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    isLoading.value = true;
    final email = emailController.text;
    final password = passwordController.text;

    try {
      final session = await account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      print('Logged in successfully: $session');
      await sessionPref.setSessionID(session.$id);
      final user = await account.get();

      await sessionPref.setUserInfo(user);
      Get.snackbar('Success', 'Logged in successfully');
      Get.offAllNamed('/home');
    } catch (e) {
      print('Error logging in: $e');
      Get.snackbar('Error', 'Error logging in: $e');
    }

    isLoading.value = false;
  }
}
