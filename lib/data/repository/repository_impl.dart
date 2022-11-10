import 'dart:async';
import 'dart:io';

import 'package:api_artikel/data/model/deleted_artikel_model.dart';
import 'package:api_artikel/data/model/list_artikel_model.dart';
import 'package:api_artikel/data/model/login_model.dart';
import 'package:api_artikel/data/model/logout_model.dart';
import 'package:api_artikel/data/model/post_artikel_model.dart';
import 'package:api_artikel/data/model/register_model.dart';
import 'package:api_artikel/data/model/show_model.dart';
import 'package:api_artikel/data/model/update_artikel_model.dart';
import 'package:api_artikel/data/network_core.dart';
import 'package:api_artikel/data/repository/repository.dart';
import 'package:api_artikel/data/storage_core.dart';
import 'package:api_artikel/ui/mainPage/main_screen.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();
  final storage = Get.find<StorageCore>();

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
  FutureOr<ListArtikelModel> getListArtikelModel() async {
    try {
      var response = await network.dio.get("/post", options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${storage.getAccessToken()}"
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
  FutureOr<ShowModel> getShowModel(String id) async {
    try {
      var response = await network.dio.get("/post/$id", options:  Options(
        headers: {
          "Accept" : "application/json",
          "Authorization" : "Bearer ${storage.getAccessToken()}"
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
  FutureOr<PostArtikelModel> postArtikelModel(String title, String content, File? image) async {
    try {
      var formData = FormData.fromMap({
        "title": title,
        "content": content,
      });

      if(image != null) {
        formData.files.addAll([
          MapEntry("image", await MultipartFile.fromFile(image.path))
        ]);
      }

      var response = await network.dio.post("/post",data: formData, options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${storage.getAccessToken()}"
          }
      ));
      print(response.data);
      return PostArtikelModel.fromJson(response.data);
    } on DioError catch(e) {
      print(e.response?.data.toString());
      return PostArtikelModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<DeletedArtikelModel> deletedArtikelModel(String id) async {
    try {
      var response = await network.dio.delete("/post/$id", options:  Options(
          headers: {
            "Accept" : "application/json",
            "Authorization" : "Bearer ${storage.getAccessToken()}"
          }
      ));
      print(response.data);
      return DeletedArtikelModel.fromJson(response.data);
    } on DioError catch (e){
      print(e.response?.data.toString());
      return DeletedArtikelModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<LogoutModel> logoutModel(String username, String password) async {
    try {
      var response = await network.dio.post("/logout",data: {"username":username, "password":password}, options:  Options(
          headers: {
            "Accept" : "application/json",
            "Authorization" : "Bearer ${storage.getAccessToken()}"
          }
      ));
      print(response.data);
      return LogoutModel.fromJson(response.data);
    } on DioError catch (e){
      print(e.response?.data.toString());
      return LogoutModel.fromJson(e.response?.data);
    }
    }

  @override
  FutureOr<UpdateArtikelModel> updateArtikelModel(String id, String title, String content, File? image, String token) async {
    try {
      var formData = FormData.fromMap({
        "title": title,
        "content": content,
      });

      if(image != null) {
        formData.files.addAll([
          MapEntry("image", await MultipartFile.fromFile(image.path))
        ]);
      }

      var response = await network.dio.post("/post/$id",data: formData, options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${storage.getAccessToken()}",
            "Content-Type" : "multipart/form-data"
          }
      ));
      print(response.data);
      return UpdateArtikelModel.fromJson(response.data);
    } on DioError catch(e) {
      print(e.response?.data.toString());
      return UpdateArtikelModel.fromJson(e.response?.data);
    }
  }
  }