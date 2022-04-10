import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingServices extends GetxService {
  late SharedPreferences sharedPrefer;
  Future<SettingServices> init() async {
    sharedPrefer = await SharedPreferences.getInstance();

    return this;
  }

  String getLang() {
    return sharedPrefer.getString("lang") ?? Get.deviceLocale!.languageCode;
  }

  Future<bool> setLang(String lang) {
    return sharedPrefer.setString("lang", lang);
  }

  Future<bool> setDirectionLTR(bool direction) {
    return sharedPrefer.setBool("direction", direction);
  }

  bool getDirectionLTR() {
    return sharedPrefer.getBool("direction") ?? true;
    //Get.deviceLocale!.languageCode == "en";
  }

  Future<bool> setToken(String token) {
    return sharedPrefer.setString("token", token);
  }

  Future<bool> setName(String name) {
    return sharedPrefer.setString("name", name);
  }

  Future<bool> setEmail(String name) {
    return sharedPrefer.setString("email", name);
  }

  Future<bool> setPassword(String name) {
    return sharedPrefer.setString("password", name);
  }

  String getToken() {
    return sharedPrefer.getString("token") ?? "";
  }

  String getName() {
    return sharedPrefer.getString("name") ?? "";
  }

  String getEmail() {
    return sharedPrefer.getString("email") ?? "";
  }

  String getPassword() {
    return sharedPrefer.getString("password") ?? "";
  }
}
