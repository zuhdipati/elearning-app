import 'package:get_storage/get_storage.dart';

class Utils {
  static final _storage = GetStorage();

  static Future<bool?> getBoolOnBoarding() async {
    return _storage.read('onboarding');
  }

  static Future<void> setOnBoarding({bool show = true}) async {
    await _storage.write('onboarding', show);
  }

  static Future<String?> getToken() async {
    return _storage.read<String>('token');
  }

  static Future<void> setToken(String? accessToken) async {
    if (accessToken != null) {
      await _storage.write('token', accessToken);
    }
  }

  static Future<void> removeToken() async {
    await _storage.remove('token');
  }
}
