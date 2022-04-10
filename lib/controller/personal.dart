import 'dart:developer';

import 'package:devbey/model/personal-info.dart';
import 'package:devbey/service/remote-services.dart';
import 'package:get/state_manager.dart';

class PersonalController extends GetxController {
  final RxString connectivityResult = "Unknown".obs;
  final RxBool hasError = false.obs;
  final RxBool isLoading = true.obs;
  bool isNotFetchAPI = true;
  late PersonalIfo personalIfo;

  Future<void> getDataProfile() async {
    isNotFetchAPI = false;
    dynamic response = await RemoteServices.fetchProfile("profile/show");
    try {
      if (response == null) throw Error();
      if (response.statusCode == 200) {
        personalIfo = PersonalIfo.fromJson(response.body);
        isLoading.value = false;
      } else
        throw Error();
    } catch (e) {
      hasError.value = true;
      isLoading.value = false;
    }
  }
}
