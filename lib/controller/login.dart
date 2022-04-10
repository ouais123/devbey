import 'dart:convert';
import 'dart:developer';

import 'package:devbey/model/message-auth.dart';
import 'package:devbey/service/remote-services.dart';
import 'package:devbey/service/settings-services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxString connectivityResult = "Unknown".obs;
  final RxBool isObscure = true.obs;

  final GlobalKey<FormState> formStateLogin = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;

  final SettingServices settingServices = Get.find();

  Future<MessageAuth> sigIn(String email, String password) async {
    Map<String, String> queryParams = {
      "email": email,
      "password": password,
    };

    dynamic response = await RemoteServices.fetchLogin("login", queryParams);

    if (response == null)
      return MessageAuth(isSuccess: false, message: "Something went wrong");

    Map<String, dynamic> bodyRes = json.decode(response.body);
    if (response.statusCode == 200) {
      settingServices.setToken(bodyRes['token']);
      settingServices.setName(bodyRes["user"]["name"]);
      settingServices.setEmail(email);
      settingServices.setPassword(password);
      return MessageAuth(isSuccess: true, message: "");
    } else {
      return MessageAuth(
          isSuccess: false,
          message: bodyRes['error']['message'] ?? "Something went wrong");
    }
  }
}
