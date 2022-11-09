import 'package:api_artikel/theme/theme.dart';
import 'package:api_artikel/ui/mainPage/main_controller.dart';
import 'package:api_artikel/ui/postPage/post_artikel.dart';
import 'package:api_artikel/ui/showPage/show_artikel.dart';
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(PostArticle(), transition: Transition.cupertino);
          },
          backgroundColor: Colors.white,
          splashColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(width: 2, color: listColor),
          ),
          child: Icon(
            Icons.post_add_rounded,
            color: listColor,
            size: 40,
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: listColor,
          title: Text(
            'e-Artikel',
            style: GoogleFonts.mali(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "assets/img/img_ic_logout.png",
                width: 25,
              ),
            ),
          ],
        ),
        body: controller.listArtikelModel != null
            ? ListView.builder(
                padding: const EdgeInsets.all(8),
                primary: false,
                shrinkWrap: true,
                itemCount: controller.listArtikelModel!.data!.length,
                itemBuilder: (context, index) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: listColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(ShowArtikel(),
                                arguments: controller.listArtikelModel
                                    ?.data?[index]?.id ??
                                    "",
                                transition: Transition.cupertino);
                          },
                          child: Image.network(
                            controller.listArtikelModel?.data?[index].image ??
                                "https://",
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 210,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(ShowArtikel(),
                                    arguments: controller.listArtikelModel
                                            ?.data?[index]?.id ??
                                        "",
                                    transition: Transition.cupertino);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 200,
                                    child: Text(
                                      controller.listArtikelModel?.data?[index]
                                              .title ??
                                          "",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.mali(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person_pin_outlined,
                                        size: 15,
                                        color: listColor,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                230,
                                        child: Text(
                                          controller.listArtikelModel
                                                  ?.data?[index].author ??
                                              "",
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.mali(
                                            fontWeight: regular,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_rounded,
                                        size: 15,
                                        color: listColor,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                230,
                                        child: Text(
                                          controller.listArtikelModel
                                                  ?.data?[index].createdAt ??
                                              "",
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.tienne(
                                            fontWeight: regular,
                                            fontSize: 12,
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
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.edit_note,
                                  size: 35,
                                  color: listColor,
                                ),
                                Icon(
                                  Icons.delete,
                                  size: 35,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
