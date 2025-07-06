
import 'package:shared_preferences/shared_preferences.dart';

abstract class BasePref {
  Future<SharedPreferences> get pref async => (await SharedPreferences.getInstance());

  Future<void> clear();
}