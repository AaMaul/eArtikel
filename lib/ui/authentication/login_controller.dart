import 'package:api_artikel/data/model/login_model.dart';
import 'package:api_artikel/data/repository/repository.dart';
import 'package:api_artikel/ui/mainPage/main_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/storage_core.dart';

class LoginController extends GetxController {
  final repository = Get.find<Repository>();

  LoginModel? loginModel;

  var isObscure = false.obs;
  var isLoading = false.obs;
  final storage = StorageCore();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    usernameController.text;
    passwordController.text;

    update();
  }
  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void login(String username, String password) async {
    try {
      isLoading.isTrue;
      var response = await repository.postLogin(username, password);
      loginModel = response;
      update();
      if (response.meta?.code == 200) {
        // loginModel = LoginModel.fromJson(response.data);
        storage.saveAuthResponse(response);
        // isLoading.isFalse
        print(response.data);
        /// pindah ke homepage
        Get.offAll(() => const MainScreen(), transition: Transition.cupertino);
        // Get.to(MainScreen(), transition: Transition.cupertino);
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(response.meta?.message ?? "Something went wrong")));
      }
    } on DioError catch(e) {
      print(e.toString());
      return null;
    }
  }
}