import 'package:alison_ecommerce/main.dart';
import 'package:alison_ecommerce/utils/middleware/dio_middleware.dart';
import 'package:dio/dio.dart';

import '../../../../utils/shared_data/shared_data.dart';
import 'model/model.dart';

class SignInService {
  Future signIn({required SignInModel signInModel}) async {
    try{
      Response response = await dioApiCall().post(apiRoutes.signIn, data: {
        "email_phone": signInModel.email,
        "password": signInModel.password
      });
      print("the response is ${response.data}");
      if(response.statusCode==200&&response.data["success"]!=0){
        await sharedPreferenceModel.set(key: SharedPreferenceKey.id,keyValue: response.data["customerdata"]["id"]);
        await sharedPreferenceModel.set(key: SharedPreferenceKey.token,keyValue: response.data["customerdata"]["token"]);
        return response.data;
      }
      else{
        throw Error();
      }
    }catch(e){
      rethrow;
    }

  }
}
