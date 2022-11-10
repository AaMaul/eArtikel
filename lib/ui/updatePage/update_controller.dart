import 'dart:io';

import 'package:api_artikel/data/model/post_artikel_model.dart';
import 'package:api_artikel/data/model/show_model.dart';
import 'package:api_artikel/data/model/update_artikel_model.dart';
import 'package:api_artikel/data/repository/repository.dart';
import 'package:api_artikel/data/storage_core.dart';
import 'package:api_artikel/ui/mainPage/main_screen.dart';
import 'package:api_artikel/ui/updatePage/update_artikel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateController extends GetxController {
  final repository = Get.find<Repository>();
  ShowModel? getShowArtikelModel =  ShowModel();
  UpdateArtikelModel? updateArtikelModel = UpdateArtikelModel();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String? token = StorageCore().getAccessToken();
  File? fotoBanner;

  var isLoading = false.obs;

  final storage = StorageCore();
  final keyForm = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    titleController.text;
    contentController.text;
    showArtikel(Get.arguments);

    update();
  }

  void updateArtikel(String title, String content, File? image) async {
    try {
      isLoading.isTrue;
      var response = await repository.updateArtikelModel(Get.arguments, title, content, fotoBanner, token!);
      updateArtikelModel = response;
      update();
      if (response.meta?.status == "success") {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: Text("Artikel berhasil di update")));
        print(response.data);
        Get.offAll(() => MainScreen(), transition: Transition.cupertino);
      }
      update();
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

  void showArtikel(String id) async {
    try {
      print(Get.arguments);
      isLoading.isTrue;
      var response = await repository.getShowModel(id);
      getShowArtikelModel = response;
      update();
      // if (response.meta?.status == "success") {
      //   ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      //       content: Text("Artikel berhasil di tambahkan")));
      //   print(response.data);
      //   Get.offAll(() => const UpdateArtikel(), transition: Transition.cupertino);
      // }
    }  catch (e) {
      return null;
      // if (e.response?.statusCode == 422) {
      //   ScaffoldMessenger.of(Get.context!)
      //       .showSnackBar(SnackBar(content: Text(e.response?.data["message"])));
      // } else {
      //   ScaffoldMessenger.of(Get.context!)
      //       .showSnackBar(SnackBar(content: Text(e.response?.data["message"])));
      // }
    }
    update();
  }
}