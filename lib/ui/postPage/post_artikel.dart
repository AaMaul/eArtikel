import 'package:api_artikel/theme/theme.dart';
import 'package:api_artikel/ui/postPage/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PostArticle extends StatelessWidget {
  const PostArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
      init: PostController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: listColor,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Input Artikel',
            style: GoogleFonts.mali(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Input Judul Artikel',
                style: GoogleFonts.beVietnamPro(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
