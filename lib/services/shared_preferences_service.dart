import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> getSharedPreferencesInstance() async {
    await _prefs.catchError((e) {
      print("shared preferences error : $e");
      return false;
    });
    return true;
  }

  Future setToken(String token) async {
    final pref = await _prefs;
    pref.setString('token', token);
  }

  Future clearToken() async {
    final pref = await _prefs;
    pref.clear();
  }

  Future get token async {
    final pref = await _prefs;
    return pref.getString('token');
  }
}

SharedPreferenceService sharedPreferenceService = SharedPreferenceService();
