import 'package:devbey/service/settings-services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  final SettingServices settingServices = Get.find();

  late Locale localeApp;
  @override
  void onInit() {
    super.onInit();
    localeApp = Locale(settingServices.getLang());
  }
}
