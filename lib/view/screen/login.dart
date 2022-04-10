import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:devbey/controller/login.dart';
import 'package:devbey/view/widget/auth/login-body.dart';
import 'package:devbey/view/widget/error/internet-error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());
  void checkConnectivity() async {
    ConnectivityResult result = await (Connectivity().checkConnectivity());
    loginController.connectivityResult.value = result.toString();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    double height = size.height;
    checkConnectivity();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () {
              if (loginController.connectivityResult.value == "Unknown") {
                return const SizedBox();
              } else if (loginController.connectivityResult.value ==
                  "ConnectivityResult.none") {
                return InternetError(
                  text:
                      "No internet Turn on wifi Or phone data and try again".tr,
                  margen: height * 0.3,
                  icon: Icons.wifi_lock_outlined,
                  color: Colors.red,
                  textColor: Colors.white,
                  onTap: () {
                    checkConnectivity();
                  },
                );
              } else {
                return LoginBody();
              }
            },
          ),
        ),
      ),
    );
  }
}
