import 'package:api_artikel/data/model/deleted_artikel_model.dart';
import 'package:api_artikel/data/model/list_artikel_model.dart';
import 'package:api_artikel/data/model/logout_model.dart';
import 'package:api_artikel/data/repository/repository.dart';
import 'package:api_artikel/data/storage_core.dart';
import 'package:api_artikel/ui/authentication/login_page.dart';
import 'package:api_artikel/ui/mainPage/main_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final repository = Get.find<Repository>();


  ListArtikelModel? listArtikelModel;
  DeletedArtikelModel? deletedArtikelModel;
  LogoutModel? logoutModel;

  final storage = StorageCore();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getArtikel();
    update();
  }

  getArtikel()async{
    try{
      var res = await repository.getListArtikelModel();
      listArtikelModel=res;
      update();
    }catch(e){
      update();
      return null;
    }
  }

  void deleteArticle(String id, String token) async {
    try {
      var response = await repository.deletedArtikelModel(id);
      deletedArtikelModel = response;
      update();
      if (response.meta?.status == "success") {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: Text("Artikel berhasil di hapus")));
        print(response.data);
        Get.offAll(() => const MainScreen(), transition: Transition.cupertino);
        update();
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 422) {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: Text(e.response?.data["message"])));
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: Text(e.response?.data["message"])));
      }
    }
  }

  void logout(String username, String password) async {
    try {
      var response = await repository.logoutModel(username, password);
      logoutModel = response;
      update();
      if (response.meta?.status == "success") {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: Text("Anda Berhasil Logout")));
        print(response.data);
        Get.offAll(() => const PageLogin(), transition: Transition.cupertino);
      }
      storage.deleteAuthResponse();
    } on DioError catch (e) {
      if (e.response?.statusCode == 422) {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: Text(e.response?.data["message"])));
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: Text(e.response?.data["message"])));
      }
    }
  }

}