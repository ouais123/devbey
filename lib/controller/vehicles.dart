import 'dart:convert';
import 'dart:developer';

import 'package:devbey/model/vehicle.dart';
import 'package:devbey/service/remote-services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehiclesController extends GetxController {
  final RxString connectivityResult = "Unknown".obs;
  final RxBool hasError = false.obs;
  final RxBool isLoading = true.obs;
  bool isNotFetchAPI = true;

  Future<void> getDataVehicles({
    required String formDate,
    required String toDate,
    required int pickupLocationId,
    required bool isReturnLocation,
    required int deliveryLocationId,
  }) async {
    isNotFetchAPI = false;

    Map<String, String> queryParams = {
      "from": formDate,
      "to": toDate,
      "receiving_location": pickupLocationId.toString(),
      "deliver_to_different_location": isReturnLocation.toString(),
    };
    if (isReturnLocation)
      queryParams['delivering_location'] = deliveryLocationId.toString();

    dynamic response =
        await RemoteServices.fetchVehicles("cars/non-reserved", queryParams);

    try {
      if (response == null) throw Error();
      if (response.statusCode == 200) {
        Map<String, dynamic> bodyRes = json.decode(response.body);
        allVehicles = bodyRes['data'];
        addMore();
        isLoading.value = false;
      } else
        throw Error();
    } catch (e) {
      hasError.value = true;
      isLoading.value = false;
    }
  }

  late List<dynamic> allVehicles;
  RxList<Vehicle> vehicles = <Vehicle>[].obs;

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          (currentPage < allVehicles.length)) addMore();
    });
  }

  int currentMax = 4;
  int currentPage = 0;
  ScrollController scrollController = ScrollController();
  void addMore() {
    int length = currentPage + currentMax;
    if (allVehicles.length - length < 0)
      length = currentPage + (-(length - allVehicles.length) + currentMax);

    for (int i = currentPage; i < length; i++)
      vehicles.add(Vehicle.fromMap(allVehicles[i]));

    currentPage += currentMax;
  }
}
