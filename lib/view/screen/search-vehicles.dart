import 'dart:developer';
import 'dart:ui' as ui;

import 'package:devbey/controller/search-vehicles.dart';
import 'package:devbey/controller/personal.dart';
import 'package:devbey/service/remote-services.dart';
import 'package:devbey/service/settings-services.dart';
import 'package:devbey/view/screen/search-location.dart';
import 'package:devbey/view/widget/search-vehicles/search-vehicles-button.dart';
import 'package:devbey/view/widget/drawer/personal-drawer.dart';
import 'package:devbey/view/widget/search-vehicles/search-vehicles-checkbox-tile.dart';
import 'package:devbey/view/widget/search-vehicles/search-vehicles-input.dart';
import 'package:devbey/view/widget/app/app-tap-bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchVehicles extends StatelessWidget {
  SearchVehicles({Key? key}) : super(key: key);
  final SearchVehiclesController getVehiclesController =
      Get.put(SearchVehiclesController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    bool isLandscape = mediaQueryData.orientation == Orientation.landscape;
    return Scaffold(
      key: _scaffoldKey,
      drawer: VehiclesDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              AppTapBar(
                leftIconData: Icons.menu,
                rightIconData: Icons.logout,
                leftOnTap: () => _scaffoldKey.currentState!.openDrawer(),
                rightOnTap: logoutAccount,
              ),
              AspectRatio(
                aspectRatio: isLandscape ? 7 / 1 : 3.5 / 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Find the right vehicle",
                    textAlign: TextAlign.center,
                    style: buildTitleTextStyle(),
                  ),
                ),
              ),
              Form(
                key: getVehiclesController.formStateTime,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: isLandscape ? 8.4 / 1 : 4.2 / 1,
                      child: SearchVehiclesInput(
                        title: "Receipt time",
                        initialValue: getVehiclesController.receiptTime.value,
                        content: Obx(
                          () => Text(
                            getVehiclesController.receiptTime.value,
                            style: buildInputTitleTextStyle(),
                          ),
                        ),
                        icon: FluentIcons.timer_24_regular,
                        onTap: () => selectTime(context, "start"),
                        validator: (receiptTime) {
                          DateTime RT = DateTime.parse(
                              getVehiclesController.receiptTime.value);
                          DateTime DT = DateTime.parse(
                              getVehiclesController.deliveryTime.value);

                          if (RT.isAfter(DT))
                            return "Receipt time after delivery time";

                          return null;
                        },
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: isLandscape ? 8.4 / 1 : 4.2 / 1,
                      child: SearchVehiclesInput(
                        title: "Delivery time",
                        initialValue: getVehiclesController.deliveryTime.value,
                        content: Obx(
                          () => Text(
                            getVehiclesController.deliveryTime.value,
                            style: buildInputTitleTextStyle(),
                          ),
                        ),
                        icon: FluentIcons.timer_24_regular,
                        onTap: () => selectTime(context, "last"),
                        validator: (deliveryTime) {
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: isLandscape ? 8.4 / 1 : 4.2 / 1,
                child: Form(
                  key: getVehiclesController.formStatePickupLocation,
                  child: SearchVehiclesInput(
                    title: "Pickup location",
                    content: Obx(
                      () => Text(
                        getVehiclesController.valuePickupLocation.value,
                        style: buildInputTitleTextStyle(),
                      ),
                    ),
                    icon: FluentIcons.map_24_regular,
                    onTap: () => selectPickupLocation(context),
                    initialValue: "Select location",
                    validator: (pickupLocation) {
                      if (getVehiclesController.valuePickupLocation.value ==
                          pickupLocation)
                        return "you must be select pickup location";

                      return null;
                    },
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: isLandscape ? 15 / 1 : 8 / 1,
                child: SearchVehiclesChecknox(),
              ),
              AspectRatio(aspectRatio: isLandscape ? 50 / 1 : 30 / 1),
              AspectRatio(
                aspectRatio: isLandscape ? 8.4 / 1 : 4.2 / 1,
                child: Form(
                  key: getVehiclesController.formStateDeliveryLocation,
                  child: Obx(
                    () => SearchVehiclesInput(
                      title: "Delivery location",
                      content: Obx(
                        () => Text(
                          getVehiclesController.valueDeliveryLocation.value,
                          style: TextStyle(
                            color: getVehiclesController.isReturnLocation.value
                                ? Colors.grey
                                : Colors.grey.withOpacity(0.7),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      initialValue: "Select location",
                      icon: FluentIcons.map_24_regular,
                      onTap: getVehiclesController.isReturnLocation.value
                          ? () => selectDeliveryLocation(context)
                          : null,
                      validator: (deliveryLocation) {
                        if (getVehiclesController.valueDeliveryLocation.value ==
                                deliveryLocation &&
                            getVehiclesController.isReturnLocation.value)
                          return "you must be select delivery location";
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              AspectRatio(aspectRatio: isLandscape ? 30 / 1 : 40 / 1),
              AspectRatio(
                aspectRatio: isLandscape ? 14.4 / 1 : 7.2 / 1,
                child: SearchVehiclesButton(
                  title: "Search For Vehicle",
                  onTap: searchVehicles,
                ),
              ),
              AspectRatio(aspectRatio: isLandscape ? 25 / 1 : 15 / 1),
              AspectRatio(
                aspectRatio: isLandscape ? 8 / 1 : 6 / 1,
                child: Image.asset("assets/images/devbay-main.png"),
              ),
              AspectRatio(aspectRatio: isLandscape ? 18 / 1 : 20 / 1),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectTime(BuildContext context, String tag) async {
    DateTime now = DateTime.now();
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(
        const Duration(days: 30 * 24),
      ),
    );
    if (dateTime != null) {
      TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );

      if (timeOfDay != null) {
        if (tag == "start") {
          getVehiclesController.receiptTime.value =
              DateFormat("yyyy-MM-dd hh:mm").format(DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            timeOfDay.hour,
            timeOfDay.minute,
          ));
        } else {
          getVehiclesController.deliveryTime.value =
              DateFormat("yyyy-MM-dd hh:mm").format(DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            timeOfDay.hour,
            timeOfDay.minute,
          ));
        }
      }
    }
  }

  TextStyle buildInputTitleTextStyle() {
    return TextStyle(
      color: Colors.grey,
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle buildTitleTextStyle() {
    return TextStyle(
      fontSize: 25.sp,
      color: Colors.red,
      fontWeight: FontWeight.w300,
      fontFamily: "Lato",
    );
  }

  void selectPickupLocation(BuildContext context) async {
    getVehiclesController.isClickPickupLocation = true;
    getVehiclesController.isClickDeliveryLoction = false;
    await showSearch(
      context: context,
      delegate: SearchLocation(),
    );
  }

  void selectDeliveryLocation(BuildContext context) async {
    getVehiclesController.isClickDeliveryLoction = true;
    getVehiclesController.isClickPickupLocation = false;
    await showSearch(
      context: context,
      delegate: SearchLocation(),
    );
  }

  void searchVehicles() {
    FormState formStatePL =
        getVehiclesController.formStatePickupLocation.currentState!;
    FormState formStateDL =
        getVehiclesController.formStateDeliveryLocation.currentState!;
    FormState formStateT = getVehiclesController.formStateTime.currentState!;

    final bool isSuccessPL = formStatePL.validate();

    final bool isSuccessDL = formStateDL.validate();

    final bool isSuccessT = formStateT.validate();

    if (isSuccessPL && isSuccessDL && isSuccessT)
      Get.toNamed(
        "/search-vehicles/vehicles",
        arguments: {
          "receipt_time": getVehiclesController.receiptTime.value,
          "delivery_time": getVehiclesController.deliveryTime.value,
          "pickup_location_id": getVehiclesController.locationPickup.id,
          "is_return_location": getVehiclesController.isReturnLocation.value,
          "delivery_location_id": getVehiclesController.locationDelivery != null
              ? getVehiclesController.locationDelivery!.id
              : 0,
        },
      );
  }

  void logoutAccount() {
    logout();
    Get.offNamed("/");
  }

  void logout() async {
    dynamic response = await RemoteServices.fetchLogout("logout", {});
    try {
      if (response == null) throw Error();
      if (response.statusCode != 200) throw Error();
    } catch (e) {
      Get.showSnackbar(buildGetSnackBar(
        "some error has happened".tr,
        Icons.error_outline_outlined,
      ));
    }
  }

  final SettingServices settingServices = Get.find();

  GetSnackBar buildGetSnackBar(String message, IconData icon) => GetSnackBar(
        messageText: Text(
          message,
          textDirection: settingServices.getDirectionLTR()
              ? ui.TextDirection.ltr
              : ui.TextDirection.rtl,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 2, milliseconds: 900),
      );
}
