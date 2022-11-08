import 'package:api_artikel/data/model/register_model.dart';
import 'package:api_artikel/data/repository/repository.dart';
import 'package:api_artikel/data/storage_core.dart';
import 'package:api_artikel/ui/authentication/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  final reposiroty = Get.find<Repository>();

  RegisterModel? registerModel;

  var isObscure = false.obs;
  var isLoading = false.obs;
  final storage = StorageCore();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    usernameController.text;
    emailController.text;
    usernameController.text;
    passwordController.text;

    update();
  }
   @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void register(String name, String email, String username, String password) async {
    try {
      isLoading.isTrue;
      var response = await reposiroty.postRegister(name, email, username, password);
      registerModel = response;
      update();
      if (response.meta?.status == "success") {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: Text("Register Berhasil, Silakan Login!")));
        print(response.data);
        Get.offAll(() => const PageLogin(), transition: Transition.cupertino);
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
}