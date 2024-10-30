import 'package:alison_ecommerce/main.dart';
import 'package:alison_ecommerce/utils/middleware/dio_middleware.dart';
import 'package:alison_ecommerce/utils/shared_data/shared_data.dart';
import 'package:dio/dio.dart';

class OtpVerificationService {
  static Future submitOtp({required String otp}) async {
    try {
      Response response = await dioApiCall().post(apiRoutes.submitOtp, data: {
        "otp": otp
      });
      if (response.statusCode == 200 && response.data["success"] != 0) {
        await sharedPreferenceModel.set(key: SharedPreferenceKey.id,keyValue: response.data["customerdata"]["id"]);
        await sharedPreferenceModel.set(key: SharedPreferenceKey.token,keyValue: response.data["customerdata"]["token"]);
        return response.data;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
