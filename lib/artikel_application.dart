import 'package:api_artikel/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtikelApplication extends StatelessWidget {
  const ArtikelApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application Artikel',
      theme: ThemeData(
        useMaterial3:true,
        primaryColor: Colors.lightBlueAccent,
      ),
      home: const SplashScreen(),
    );
  }
}
