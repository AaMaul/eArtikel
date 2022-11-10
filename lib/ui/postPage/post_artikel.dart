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
          automaticallyImplyLeading: false,
          // leading: GestureDetector(
          //   onTap: () {
          //     Get.back();
          //   },
          //   child: Icon(
          //     Icons.arrow_back,
          //     size: 20,
          //     color: Colors.white,
          //   ),
          // ),
          title: Center(
            child: Text(
              'Input Artikel',
              style: GoogleFonts.mali(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Input Judul Artikel',
                  style: GoogleFonts.beVietnamPro(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: controller.titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                Text(
                  'Deskripsi Artikel',
                  style: GoogleFonts.beVietnamPro(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: controller.contentController,
                  minLines: 7,
                  maxLines: 20,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                controller.fotoBanner != null
                    ? Image.file(controller.fotoBanner!)
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: listColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.cloud_upload_rounded,
                              size: 50,
                              color: listColor,
                            ),
                            TextButton(
                              onPressed: () {
                                controller.getSinglePhoto();
                              },
                              child: Text(
                                'Upload Banner Artikel',
                                style: GoogleFonts.beVietnamPro(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     prefixIcon: Icon(
                //       Icons.cloud_upload,
                //       size: 30,
                //     ),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //     contentPadding: const EdgeInsets.all(12),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: listColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Center(
                          child: Text(
                            'CANCEL',
                            style: GoogleFonts.mali(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.postArtikel(
                            controller.titleController.text,
                            controller.contentController.text,
                            controller.fotoBanner);
                        // controller.register(
                        //   controller.nameController.text,
                        //   controller.emailController.text,
                        //   controller.usernameController.text,
                        //   controller.passwordController.text,
                        // );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: listColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Center(
                          child: Text(
                            'SUBMIT',
                            style: GoogleFonts.mali(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
