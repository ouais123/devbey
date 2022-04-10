import 'package:connectivity/connectivity.dart';
import 'package:devbey/controller/personal.dart';
import 'package:devbey/service/settings-services.dart';
import 'package:devbey/view/widget/error/progress-app.dart';
import 'package:devbey/view/widget/drawer/personal-info-drawer.dart';

import 'package:devbey/view/widget/error/internet-error.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VehiclesDrawer extends StatelessWidget {
  VehiclesDrawer({Key? key}) : super(key: key);
  final SettingServices settingServices = Get.find();
  final PersonalController personalController = Get.put(PersonalController());
  void checkConnectivity() async {
    ConnectivityResult result = await (Connectivity().checkConnectivity());
    personalController.connectivityResult.value = result.toString();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;

    double height = size.height;

    String accountName = settingServices.getName();
    String accountEmail = settingServices.getEmail();
    checkConnectivity();
    if (personalController.isNotFetchAPI) personalController.getDataProfile();

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Icon(
                Icons.person,
                color: Colors.white,
                size: 70.sp,
              ),
              accountName: Text(accountName),
              accountEmail: Text(accountEmail),
            ),
            Obx(() {
              if (personalController.connectivityResult.value == "Unknown") {
                return const SizedBox();
              } else if (personalController.connectivityResult.value ==
                  "ConnectivityResult.none") {
                return InternetError(
                  text:
                      "No internet Turn on wifi Or phone data and try again".tr,
                  margen: height * 0.135,
                  icon: Icons.wifi_lock_outlined,
                  color: Colors.red,
                  textColor: Colors.white,
                  onTap: () {
                    checkConnectivity();
                  },
                );
              } else if (personalController.hasError.value) {
                return InternetError(
                  text: "Has error happened try again".tr,
                  margen: height * 0.135,
                  icon: Icons.wifi_lock_outlined,
                  color: Colors.red,
                  textColor: Colors.white,
                  onTap: () {
                    personalController.hasError.value = false;
                    personalController.isLoading.value = true;
                    checkConnectivity();
                    personalController.getDataProfile();
                  },
                );
              } else {
                return personalController.isLoading.value
                    ? ProgressApp(
                        height: height * 0.7,
                      )
                    : PersonalInfoDrawer();
              }
            }),
          ],
        ),
      ),
    );
  }
}
