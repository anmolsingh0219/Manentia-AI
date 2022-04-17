import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;
  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  String get authToken => _sharedPrefs.getString('auth_token') ?? "";

  set authToken(String value) {
    _sharedPrefs.setString('auth_token', value ?? "");
  }

  bool get firstLaunchDone =>
      _sharedPrefs.getBool('first_launch_done') ?? false;

  set firstLaunchDone(bool value) {
    _sharedPrefs.setBool('first_launch_done', value ?? false);
  }

  bool get isDarkMode => _sharedPrefs.getBool('is_dark_mode') ?? true;

  set isDarkMode(bool value) {
    _sharedPrefs.setBool('is_dark_mode', value ?? true);
  }

  int get doctorID => _sharedPrefs.getInt('doctor_id') ?? 0;

  set doctorID(int value) {
    _sharedPrefs.setInt('doctor_id', value ?? 0);
  }

  String get doctorPhone => _sharedPrefs.getString('doctor_phone') ?? "";

  set doctorPhone(String value) {
    _sharedPrefs.setString('doctor_phone', value ?? "");
  }

  bool get isGuestUser => _sharedPrefs.getBool('is_guest_user') ?? false;

  set isGuestUser(bool value) {
    _sharedPrefs.setBool('is_guest_user', value ?? false);
  }

  String get guestUserName => _sharedPrefs.getString('guest_user_name') ?? "";

  set guestUserName(String value) {
    _sharedPrefs.setString('guest_user_name', value ?? "");
  }

  String get guestResponseModel =>
      _sharedPrefs.getString('guest_response_model') ?? "";

  set guestResponseModel(String value) {
    _sharedPrefs.setString('guest_response_model', value ?? "");
  }

  String get apiEndPoint => _sharedPrefs.getString('api_endpoint') ?? "";

  set apiEndPoint(String value) {
    _sharedPrefs.setString('api_endpoint', value ?? "");
  }

  clear() async {
    await _sharedPrefs.clear();
  }
}
