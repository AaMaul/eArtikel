import 'dart:async';

import 'package:api_artikel/data/model/list_artikel_model.dart';
import 'package:api_artikel/data/model/login_model.dart';
import 'package:api_artikel/data/model/post_artikel_model.dart';
import 'package:api_artikel/data/model/register_model.dart';
import 'package:api_artikel/data/model/show_model.dart';
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

  @override
  FutureOr<ListArtikelModel> getListArtikelModel(String token) async {
    try {
      var response = await network.dio.get("/post", options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }
      ));
      print(response.data);
      return ListArtikelModel.fromJson(response.data);
    } on DioError catch(e) {
      print(e.response?.data.toString());
      return ListArtikelModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<ShowModel> getShowModel(int id, String token) async {
    try {
      var response = await network.dio.get("/post/$id", options:  Options(
        headers: {
          "Accept" : "application/json",
          "Authorization" : "Bearer $token"
        }
      ));
      print(response.data);
      return ShowModel.fromJson(response.data);
    } on DioError catch (e){
      print(e.response?.data.toString());
      return ShowModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<PostArtikelModel> postArtikelModel(String title, String content, String image, String token) async {
    try {
      var response = await network.dio.post("/post",data: {"title":title,"content":content,"image":image}, options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }
      ));
      print(response.data);
      return PostArtikelModel.fromJson(response.data);
    } on DioError catch(e) {
      print(e.response?.data.toString());
      return PostArtikelModel.fromJson(e.response?.data);
    }
  }
}