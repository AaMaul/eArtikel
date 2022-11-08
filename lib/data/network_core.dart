import 'package:api_artikel/const/app_constant.dart';
import 'package:dio/dio.dart';

class NetworkCore {
  Dio dio = Dio();

  NetworkCore() {
    dio.options = BaseOptions(
      baseUrl: AppConstant.baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
      headers: {
        "Accept" : "application/json"
      }
    );
  }
}