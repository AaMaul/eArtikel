import 'dart:async';

import 'package:api_artikel/ui/authentication/login_page.dart';
import 'package:api_artikel/ui/mainPage/main_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 5), () => Get.offAll(() => const PageLogin()));
    super.onInit();
  }
}