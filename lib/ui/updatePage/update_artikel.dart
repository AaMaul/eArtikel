import 'package:api_artikel/theme/theme.dart';
import 'package:api_artikel/ui/updatePage/update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class UpdateArtikel extends StatelessWidget {
  const UpdateArtikel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateController>(
        init: UpdateController(),
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
                    'Edit Artikel',
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
                        controller: controller.titleController
                          ..text =
                              controller.getShowArtikelModel?.data?.title ?? '',
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
                        controller: controller.contentController
                          ..text =
                              controller.getShowArtikelModel?.data?.content ??
                                  '',
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
                              child: TextButton(
                                onPressed: () {
                                  controller.getSinglePhoto();
                                },
                                child: controller.fotoBanner != null
                                    ? Image.file(controller.fotoBanner!)
                                    : Image.network(controller
                                            .getShowArtikelModel?.data?.image ??
                                        '', errorBuilder: (context, error, stackTrace) => Lottie.asset("assets/json/send_load.json"),),
                                // Text(
                                //   'Upload Banner Artikel',
                                //   style: GoogleFonts.beVietnamPro(
                                //       fontSize: 14, fontWeight: FontWeight.bold),
                                // ),
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
                              controller.updateArtikel(
                                  controller.titleController.text,
                                  controller.contentController.text,
                                  controller.fotoBanner);
                              // controller.register(
                              //   controller.nameController.text,
                              //   controller.emailController.text,
                              //   controller.usernameController.text,
                              //   controller.passwordController.text,
                              // );
                              controller.update();
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
                                  'SAVE',
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
            ));
  }
}
