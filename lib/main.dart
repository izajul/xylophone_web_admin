import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xylophone_web/controller/authController.dart';
import 'package:xylophone_web/views/screens/add_song_screen.dart';
import 'package:xylophone_web/views/screens/home_screen.dart';
import 'package:xylophone_web/views/screens/login_screen.dart';
import 'package:xylophone_web/views/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: MyHomePage(),
      // initialRoute: '/splash',
      initialRoute: "/addSong",
      onGenerateRoute: (settings) {
        late final Widget nextScreen;
        switch (settings.name) {
          case '/splash':
            nextScreen = SplashScreen();
            break;

          case '/login':
            nextScreen = LoginScreen();
            break;

          case '/home':
            nextScreen = HomeScreen();

          case '/addSong':
            nextScreen = AddSongScreen();
        }
        return MaterialPageRoute(builder: (context) => nextScreen);
      },
    );
  }
}
