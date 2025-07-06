import 'package:xylophone_web/localPref/basePref.dart';

class SessionPref extends BasePref {
  final String _keyID = "key.session.id";

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

  @override
  Future<void> clear() async {
    await removeSessionID();
  }
}
