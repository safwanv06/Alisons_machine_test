import 'package:alison_ecommerce/main.dart';
import 'package:alison_ecommerce/utils/shared_data/shared_data.dart';
import 'package:alison_ecommerce/view/splashscreen/model/model.dart';

class SplashScreenService {
  static Future<AuthState> authStateCheck() async {
    String token =
        await sharedPreferenceModel.get(key: SharedPreferenceKey.token);
    if (token == "") {
      return AuthState.notAuthenticated;
    } else {
      return AuthState.authenticated;
    }
  }
}
