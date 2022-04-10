import 'package:devbey/model/item-search.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchVehiclesController extends GetxController {
  final RxString receiptTime =
      DateFormat("yyyy-MM-dd hh:mm").format(DateTime.now()).obs;
  final RxString deliveryTime = DateFormat("yyyy-MM-dd hh:mm")
      .format(DateTime.now().add(const Duration(days: 3)))
      .obs;

  bool isClickPickupLocation = false;
  bool isClickDeliveryLoction = false;
  late ItemSearch locationPickup;
  ItemSearch? locationDelivery;

  RxString valuePickupLocation = "Select location".obs;
  RxString valueDeliveryLocation = "Select location".obs;
  void selectPickup(ItemSearch locationPickup) {
    valuePickupLocation.value = locationPickup.name;
    this.locationPickup = locationPickup;

    FormState formStatePL = formStatePickupLocation.currentState!;
    formStatePL.validate();
  }

  void selectDelivery(ItemSearch locationDelivery) {
    valueDeliveryLocation.value = locationDelivery.name;
    this.locationDelivery = locationDelivery;

    FormState formStateDL = formStateDeliveryLocation.currentState!;
    formStateDL.validate();
  }

  final RxBool isReturnLocation = false.obs;
  final GlobalKey<FormState> formStateTime = GlobalKey<FormState>();
  final GlobalKey<FormState> formStatePickupLocation = GlobalKey<FormState>();
  final GlobalKey<FormState> formStateDeliveryLocation = GlobalKey<FormState>();
}
