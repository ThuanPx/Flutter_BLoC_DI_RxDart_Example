import 'package:blocexample/src/ultis/constants.dart';
import 'package:dio/dio.dart';
import 'package:inject/inject.dart';

@module
class NetWorkModule {
  @provide
  @singleton
  BaseOptions options() => BaseOptions(baseUrl: BASE_URL, connectTimeout: TIME_OUT_NET_WORK, receiveTimeout: TIME_OUT_NET_WORK);

  @provide
  @singleton
  InterceptorsWrapper interceptorsWrapper() => InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          print('------------------Send Request-----------------');
          print('Send Request：${options.path}');
          // TODO add token
//        SharedPreferences prefs = await SharedPreferences.getInstance();
//        var token = prefs.get("token");
//        options.headers.addAll({"Token": "Bearer $token"});
          return options; //continue
        },
        onResponse: (Response response) async {
          print('--------------------Response-------------------');
          print('Response : ${response.toString()}');
          return response;
        },
      );

  @provide
  @singleton
  Dio dio() {
    Dio dio = Dio()
      ..options = options()
      ..interceptors.add(interceptorsWrapper());
    return dio;
  }
}
