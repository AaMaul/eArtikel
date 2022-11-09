import 'package:api_artikel/data/model/post_artikel_model.dart';
import 'package:api_artikel/data/repository/repository.dart';
import 'package:api_artikel/data/storage_core.dart';
import 'package:api_artikel/ui/mainPage/main_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final repository = Get.find<Repository>();

  PostArtikelModel? postArtikelModel;
  var isLoading = false.obs;

  final storage = StorageCore();
  final judulController = TextEditingController();
  final kontenController = TextEditingController();
  final imageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    judulController.text;
    kontenController.text;
    imageController.text;

    update();
  }

  @override
  void dispose() {
    super.dispose();
    judulController.dispose();
    kontenController.dispose();
    imageController.dispose();
  }

  void postArtikel(String title, String content, String image) async {
    final token = storage.getAccessToken();
    try {
      isLoading.isTrue;
      var response = await repository.postArtikelModel(title,content,image, token!);
      postArtikelModel = response;
      update();
      if (response.meta?.status == "success") {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: Text("Artikel berhasil di tambahkan")));
        print(response.data);
        Get.offAll(() => const MainScreen(), transition: Transition.cupertino);
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