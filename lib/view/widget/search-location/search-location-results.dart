import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:devbey/controller/search-location.dart';
import 'package:devbey/view/widget/error/internet-error.dart';
import 'package:devbey/view/widget/error/progress-app.dart';
import 'package:devbey/view/widget/search-location/search-location-results-empty.dart';
import 'package:devbey/view/widget/search-location/search-location-results-output.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchLocationResults extends StatefulWidget {
  SearchLocationResults({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  State<SearchLocationResults> createState() => _SearchLocationResultsState();
}

class _SearchLocationResultsState extends State<SearchLocationResults> {
  final SearchLocationController searchLocationController =
      Get.put(SearchLocationController());

  void checkConnectivity() async {
    ConnectivityResult result = await (Connectivity().checkConnectivity());
    searchLocationController.connectivityResult.value = result.toString();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    double height = size.height;
    if (searchLocationController.isNotFetchAPI)
      searchLocationController.getDataSearch(widget.query);

    checkConnectivity();
    return Obx(() {
      if (searchLocationController.connectivityResult.value == "Unknown") {
        return const SizedBox();
      } else if (searchLocationController.connectivityResult.value ==
          "ConnectivityResult.none") {
        return InternetError(
          text: "No internet Turn on wifi Or phone data and try again".tr,
          margen: height * 0.3,
          icon: Icons.wifi_lock_outlined,
          color: Colors.red,
          textColor: Colors.white,
          onTap: () {
            checkConnectivity();
          },
        );
      } else if (searchLocationController.hasError.value) {
        return InternetError(
          text: "Has error happened try again".tr,
          margen: height * 0.135,
          icon: Icons.wifi_lock_outlined,
          color: Colors.red,
          textColor: Colors.white,
          onTap: () {
            searchLocationController.hasError.value = false;
            searchLocationController.isLoading.value = true;
            checkConnectivity();
            searchLocationController.getDataSearch(widget.query);
          },
        );
      } else {
        return searchLocationController.isLoading.value
            ? ProgressApp(height: height * 0.9)
            : SearchLocationResultsOutput();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<SearchLocationController>();
  }
}
