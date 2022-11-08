import 'package:api_artikel/theme/theme.dart';
import 'package:api_artikel/ui/mainPage/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: listColor,
          title: Text(
            'E-Blog',
            style: GoogleFonts.mali(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            Icon(Icons.add),
            Icon(Icons.login_sharp),
          ],
        ),
      ),
    );
  }
}
