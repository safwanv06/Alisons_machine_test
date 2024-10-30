import 'package:alison_ecommerce/main.dart';
import 'package:alison_ecommerce/utils/middleware/dio_middleware.dart';
import 'package:alison_ecommerce/utils/shared_data/shared_data.dart';
import 'package:dio/dio.dart';

import 'model/model.dart';

class SignUpService {
  Future signUp({required SignUpModel signUpModel}) async {
    try {
      Response response = await dioApiCall().post(apiRoutes.signUp, data: {
        "name": signUpModel.name,
        "email": signUpModel.mail,
        "phone_country_code": "971",
        "phone_number": signUpModel.phone,
        "password": signUpModel.password,
        "gender": "male"
      });
      if (response.statusCode == 200) {
        print("object${response.data["customerdata"]["id"]}");
        await sharedPreferenceModel.set(
            key: SharedPreferenceKey.id,
            keyValue: response.data["customerdata"]["id"]);
        return response.data;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
