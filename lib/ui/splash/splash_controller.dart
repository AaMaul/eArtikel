import 'dart:async';

import 'package:api_artikel/data/storage_core.dart';
import 'package:api_artikel/ui/authentication/login_page.dart';
import 'package:api_artikel/ui/mainPage/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final storage = StorageCore();

  @override
  void onInit() {
    storage.ensureStorageReady();
    storage.getAccessToken();
    StorageCore.isfirstOpen().then(
      (isOpen) {
        if (isOpen == false) {
          StorageCore.setIsOpen(true);
          Timer(
            const Duration(seconds: 3),
            () => Get.offAll(
              () => const PageLogin(),
            ),
          );
        } else {
          Timer(const Duration(seconds: 3), () {
            Navigator.pushReplacement(
              Get.context!,
              MaterialPageRoute(
                  builder: (context) =>
                      storage.getAccessToken() != null ? MainScreen() : PageLogin()),
            );
          });
        }
      },
    );
    super.onInit();
  }
}
