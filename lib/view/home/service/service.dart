import 'package:alison_ecommerce/main.dart';
import 'package:alison_ecommerce/utils/middleware/dio_middleware.dart';
import 'package:alison_ecommerce/utils/shared_data/shared_data.dart';
import 'package:dio/dio.dart';

class HomeService{
  Future getHomeScreenData()async{
    try{
      Response response = await dioApiCall().post("${apiRoutes.home}?id=${await sharedPreferenceModel.get(key: SharedPreferenceKey.id)}&token=${await sharedPreferenceModel.get(key: SharedPreferenceKey.token)}");
      if(response.statusCode==200&&response.data["success"]!=0){
        return response.data;
      }
      else{
        throw Error();
      }
    }
    catch(e){
      rethrow;
    }
  }
}