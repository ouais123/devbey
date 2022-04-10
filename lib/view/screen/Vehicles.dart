import 'package:connectivity/connectivity.dart';
import 'package:devbey/controller/vehicles.dart';
import 'package:devbey/view/widget/app/app-tap-bar.dart';
import 'package:devbey/view/widget/error/internet-error.dart';
import 'package:devbey/view/widget/error/progress-app.dart';
import 'package:devbey/view/widget/vehicles/vehicles-body.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Vehicles extends StatelessWidget {
  Vehicles({Key? key}) : super(key: key);
  final VehiclesController vehiclesController = Get.put(VehiclesController());
  void checkConnectivity() async {
    ConnectivityResult result = await (Connectivity().checkConnectivity());
    vehiclesController.connectivityResult.value = result.toString();
  }

  late String formDate;
  late String toDate;
  late int pickupLocationId;
  late bool isReturnLocation;
  late int deliveryLocationId;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    double height = size.height;
    final Map<String, dynamic> routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    formDate = routeArg['receipt_time'];
    toDate = routeArg['delivery_time'];
    pickupLocationId = routeArg['pickup_location_id'];
    isReturnLocation = routeArg['is_return_location'];
    deliveryLocationId = routeArg['delivery_location_id'];

    checkConnectivity();
    if (vehiclesController.isNotFetchAPI)
      vehiclesController.getDataVehicles(
        formDate: formDate,
        toDate: toDate,
        pickupLocationId: pickupLocationId,
        isReturnLocation: isReturnLocation,
        deliveryLocationId: deliveryLocationId,
      );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: vehiclesController.scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              AppTapBar(
                leftIconData: Icons.arrow_back,
                rightIconData: Icons.notifications,
                leftOnTap: () => Get.back(),
                rightOnTap: () {},
              ),
              Obx(() {
                if (vehiclesController.connectivityResult.value == "Unknown") {
                  return const SizedBox();
                } else if (vehiclesController.connectivityResult.value ==
                    "ConnectivityResult.none") {
                  return InternetError(
                    text: "No internet Turn on wifi Or phone data and try again"
                        .tr,
                    margen: height * 0.25,
                    icon: Icons.wifi_lock_outlined,
                    color: Colors.red,
                    textColor: Colors.white,
                    onTap: () {
                      checkConnectivity();
                    },
                  );
                } else if (vehiclesController.hasError.value) {
                  return InternetError(
                    text: "Has error happened try again".tr,
                    margen: height * 0.135,
                    icon: Icons.wifi_lock_outlined,
                    color: Colors.red,
                    textColor: Colors.white,
                    onTap: () {
                      vehiclesController.hasError.value = false;
                      vehiclesController.isLoading.value = true;
                      checkConnectivity();
                      vehiclesController.getDataVehicles(
                        formDate: formDate,
                        toDate: toDate,
                        pickupLocationId: pickupLocationId,
                        isReturnLocation: isReturnLocation,
                        deliveryLocationId: deliveryLocationId,
                      );
                    },
                  );
                } else {
                  return vehiclesController.isLoading.value
                      ? ProgressApp(height: height * 0.9)
                      : VehiclesBody();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
