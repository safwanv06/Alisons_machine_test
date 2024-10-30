import 'package:dio/dio.dart';

import '../../main.dart';
import '../shared_data/shared_data.dart';

final dio = Dio();

Dio dioApiCall() {
  var userToken = '';
  var id = '';
  dio.interceptors.add(InterceptorsWrapper(onRequest:
      (RequestOptions options, RequestInterceptorHandler handler) async {
    userToken == ''
        ? userToken =
            await sharedPreferenceModel.get(key: SharedPreferenceKey.token)
        : null;
    id == ''
        ? id = await sharedPreferenceModel.get(key: SharedPreferenceKey.id)
        : null;
    Map<String, dynamic> data={};
    if (userToken != '') {
      data.addAll({"token":userToken});
    }
    if (id != "") {
      data.addAll({"id": id});
    }
    options.headers=data;
    return handler.next(options);
  }, onResponse: (Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }, onError: (DioException exception, ErrorInterceptorHandler handler) {
    return handler.next(exception);
  }));
  return dio;
}
