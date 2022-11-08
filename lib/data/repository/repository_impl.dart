import 'dart:async';

import 'package:api_artikel/data/model/login_model.dart';
import 'package:api_artikel/data/model/register_model.dart';
import 'package:api_artikel/data/network_core.dart';
import 'package:api_artikel/data/repository/repository.dart';
import 'package:api_artikel/ui/mainPage/main_screen.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();

  @override
  FutureOr<LoginModel> postLogin(String username, String password) async {
    try {
      var response = await network.dio.post("/login",data: {"username":username, "password":password}, options: Options(
        headers: {
          "Accept": "application/json"
        }
      ));
      print(response.data);
      return LoginModel.fromJson(response.data);
    } on DioError catch(e) {
      print(e.response?.data.toString());
      return LoginModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<RegisterModel> postRegister(String name, String email, String username, String password) async {
    try {
      var response = await network.dio.post("/register",data: {"name":name,"email":email,"username":username, "password":password}, options: Options(
          headers: {
            "Accept": "application/json"
          }
      ));
      print(response.data);
      return RegisterModel.fromJson(response.data);
    } on DioError catch(e) {
      print(e.response?.data.toString());
      return RegisterModel.fromJson(e.response?.data);
    }
  }
}