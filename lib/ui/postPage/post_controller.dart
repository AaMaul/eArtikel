import 'dart:io';

import 'package:api_artikel/data/model/post_artikel_model.dart';
import 'package:api_artikel/data/repository/repository.dart';
import 'package:api_artikel/data/storage_core.dart';
import 'package:api_artikel/ui/mainPage/main_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController {
  final repository = Get.find<Repository>();

  PostArtikelModel? postArtikelModel;
  var isLoading = false.obs;

  final storage = StorageCore();
  final keyForm = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  File? fotoBanner;

  @override
  void onInit() {
    super.onInit();
    titleController.text;
    contentController.text;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();

    update();
  }

  void postArtikel(String title, String content, File? image) async {
    try {
      isLoading.isTrue;
      var response = await repository.postArtikelModel(titleController.text, contentController.text, fotoBanner);
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
      update();
    }
  }

  getSinglePhoto() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      fotoBanner = file;
      update();
    } else {
      // User canceled the picker
    }
  }
}