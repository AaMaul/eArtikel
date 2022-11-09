import 'package:api_artikel/theme/theme.dart';
import 'package:api_artikel/ui/authentication/login_controller.dart';
import 'package:api_artikel/ui/authentication/register_page.dart';
import 'package:api_artikel/ui/mainPage/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PageLogin extends StatelessWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) => Scaffold(
              body: SafeArea(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          "LOGIN",
                          style: GoogleFonts.mali(
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 30, bottom: 15),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: listColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Username',
                                style: GoogleFonts.mali(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: controller.usernameController,
                                decoration: InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.person_outline_outlined, color: listColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  contentPadding: const EdgeInsets.all(12),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Password',
                                    style: GoogleFonts.mali(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Obx(() => TextFormField(
                                        controller:
                                            controller.passwordController,
                                        obscureText:
                                            controller.isObscure.isFalse,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.vpn_key_outlined,
                                            color: listColor,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              controller.isObscure.isTrue
                                                  ? Icons
                                                      .visibility_off_outlined
                                                  : Icons.visibility_outlined,
                                              color: listColor,
                                            ),
                                            onPressed: () {
                                              controller.isObscure.toggle();
                                            },
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.all(12),
                                        ),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.to(PageRegister(), transition: Transition.cupertino);
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             PageRegister()));
                                      // Get.to(PageRegister(), transition: Transition.cupertino);
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: listColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Center(
                                        child: Text(
                                          'REGISTER',
                                          style: GoogleFonts.anekMalayalam(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      controller.login(
                                          controller.usernameController.text,
                                          controller.passwordController.text);
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: listColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Center(
                                        child: Text(
                                          'LOGIN',
                                          style: GoogleFonts.anekMalayalam(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
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
                    ],
                  ),
                ),
              ),
            ));
  }
}
