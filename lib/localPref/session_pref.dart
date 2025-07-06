import 'dart:convert';

import 'package:appwrite/models.dart';
import 'package:xylophone_web/localPref/basePref.dart';

class SessionPref extends BasePref {
  final String _keyID = "key.session.id";
  final String _keyUInfo = "key.session.UInfo";

  static final SessionPref _instance = SessionPref._internal();

  factory SessionPref() => _instance;

  SessionPref._internal();

  Future<void> setSessionID(String id) async {
    final pref = await this.pref;
    await pref.setString(_keyID, id);
  }

  Future<String?> get getSessionID async => (await pref).getString(_keyID);

  Future<void> removeSessionID() async {
    final pref = await this.pref;
    await pref.remove(_keyID);
  }

  Future<bool> hasSessionID() async {
    final pref = await this.pref;
    return pref.containsKey(_keyID);
  }

  Future<void> setUserInfo(User userInfo) async {
    final u_info_str = json.encode(userInfo.toMap());
    final pref = await this.pref;
    await pref.setString(_keyUInfo, u_info_str);
  }

  Future<User?> get getUserInfo async {
    final pref = await this.pref;
    final u_info_str = pref.getString(_keyUInfo);
    if (u_info_str == null) return null;
    return User.fromMap(json.decode(u_info_str));
  }

  @override
  Future<void> clear() async {
    await removeSessionID();
  }
}
