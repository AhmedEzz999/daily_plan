import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static final PreferencesManager _instance = PreferencesManager._internal();

  PreferencesManager._internal();

  factory PreferencesManager() {
    return _instance;
  }

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getUsername() {
    return _prefs?.getString('user name');
  }

  Future<void> setUsername(String username) async {
    await _prefs?.setString('user name', username);
  }

  String? getAllTasks() {
    return _prefs?.getString('all tasks');
  }

  Future<void> setAllTasks(String allTasks) async {
    await _prefs?.setString('all tasks', allTasks);
  }
}
