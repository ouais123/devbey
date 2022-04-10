import 'dart:convert';
import 'dart:developer';

import 'package:devbey/service/settings-services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static const String BASE_URL = "https://test.devbey.com/website-api/";
  static final SettingServices settingServices = Get.find();

  static Future<dynamic> fetchLogin(
      String tag, Map<String, String> queryParams) async {
    var url = Uri.parse(BASE_URL + tag).replace(queryParameters: queryParams);
    late http.Response response;
    try {
      response = await client.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "locale": settingServices.getLang(),
        },
        encoding: Encoding.getByName("utf-8"),
      );
    } catch (e) {
      log(e.toString(), name: "ERROR");
      return null;
    }
    return response;
  }

  static Future<dynamic> fetchLogout(
      String tag, Map<String, String> queryParams) async {
    var url = Uri.parse(BASE_URL + tag).replace(queryParameters: queryParams);
    late http.Response response;
    try {
      response = await client.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "locale": settingServices.getLang(),
          "Authorization": "Bearer " + settingServices.getToken(),
        },
        encoding: Encoding.getByName("utf-8"),
      );
    } catch (e) {
      log(e.toString(), name: "ERROR");
      return null;
    }
    return response;
  }

  static Future<dynamic> fetchLocation(
      String tag, Map<String, String> queryParams) async {
    var url = Uri.parse(BASE_URL + tag).replace(queryParameters: queryParams);
    late http.Response response;
    try {
      response = await client.get(
        url,
        headers: {
          "Content-Type": "application/json",
        },
      );
    } catch (e) {
      log(e.toString(), name: "ERROR");
      return null;
    }
    return response;
  }

  static Future<dynamic> fetchProfile(
    String tag,
  ) async {
    var url = Uri.parse(BASE_URL + tag);

    late http.Response response;
    try {
      response = await client.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "locale": settingServices.getLang(),
          "Authorization": "Bearer " + settingServices.getToken(),
        },
      );
    } catch (e) {
      log(e.toString(), name: "ERROR");
      return null;
    }
    return response;
  }

  static Future<dynamic> fetchVehicles(
      String tag, Map<String, String> queryParams) async {
    var url = Uri.parse(BASE_URL + tag).replace(queryParameters: queryParams);

    late http.Response response;
    try {
      response = await client.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "locale": settingServices.getLang(),
        },
      );
    } catch (e) {
      log(e.toString(), name: "ERROR");
      return null;
    }
    return response;
  }
}
