import 'package:api_artikel/theme/theme.dart';
import 'package:api_artikel/ui/showPage/show_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ShowArtikel extends StatelessWidget {
  const ShowArtikel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowController>(
      init: ShowController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: listColor,
          title: SizedBox(
            width: MediaQuery.of(context).size.width - 150,
            child: Center(
              child: Text(
                'e-Article',
                // controller.showModel?.data?.title ?? "_",
                // overflow: TextOverflow.ellipsis,
                style: GoogleFonts.mali(
                  fontWeight: bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              )),
        ),
        body: controller.isLoading
            ? Lottie.asset("assets/json/data_load.json")
            : Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 400,
                      height: 150,
                      child:  Image.network(
                        controller.showModel?.data?.image ?? "https://",
                        fit: BoxFit.fill, errorBuilder: (context, error, stackTrace) => Lottie.asset('assets/json/send_load.json'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                       controller.showModel?.data?.title ?? '',
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.beVietnamPro(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      child: Container(
                        decoration: BoxDecoration(
                          color: listColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              const Icon(
                                Icons.person_outline,
                                color: Colors.white,
                                size: 15,
                              ),
                              Text(
                                controller.showModel?.data?.author ?? '',
                                style: GoogleFonts.beVietnamPro(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.white,
                                size: 15,
                              ),
                              Text(
                                controller.showModel?.data?.createdAt ?? '',
                                style: GoogleFonts.beVietnamPro(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1),
                      ),
                      child: Text(controller.showModel?.data?.content ?? ''),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
