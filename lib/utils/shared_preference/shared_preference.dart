import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceModel {
  ///set data to the sharedPreference
  Future set({String? key, String? keyValue}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    return {preferences.setString(key!, keyValue!)};
  }
  Future<String> get({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    String? data = preferences.getString(key);
    return data ?? '';
  }

  Future setListData({String? key, dynamic keyValue}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    return {preferences.setString(key!, keyValue!)};
  }

  Future clear() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.clear().then((value) {
      return true;
    });
  }
}

