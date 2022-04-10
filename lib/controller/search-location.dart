import 'dart:convert';
import 'dart:developer';

import 'package:devbey/model/item-search.dart';
import 'package:devbey/service/remote-services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class SearchLocationController extends GetxController {
  final RxString connectivityResult = "Unknown".obs;
  final RxBool hasError = false.obs;
  final RxBool isLoading = true.obs;
  bool isNotFetchAPI = true;

  Future<void> getDataSearch(String query) async {
    isNotFetchAPI = false;
    Map<String, String> queryParams = {
      "asciiname": query,
    };

    dynamic response =
        await RemoteServices.fetchLocation("geoplaces", queryParams);

    try {
      if (response == null) throw Error();
      if (response.statusCode == 200) {
        Map<String, dynamic> bodyRes = json.decode(response.body);
        allLocations = bodyRes['data'];
        addMore();
        isLoading.value = false;
      } else
        throw Error();
    } catch (e) {
      hasError.value = true;
      isLoading.value = false;
    }
  }

  late List<dynamic> allLocations;
  RxList<ItemSearch> locations = <ItemSearch>[].obs;

  int currentMax = 8;
  int currentPage = 0;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          (currentPage < allLocations.length)) addMore();
    });
  }

  void addMore() {
    int length = currentPage + currentMax;
    if (allLocations.length - length < 0)
      length = currentPage + (-(length - allLocations.length) + currentMax);

    for (int i = currentPage; i < length; i++)
      locations.add(ItemSearch.fromMap(allLocations[i]));

    currentPage += currentMax;
  }
}
