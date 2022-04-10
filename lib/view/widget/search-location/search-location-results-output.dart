import 'package:devbey/controller/search-location.dart';
import 'package:devbey/service/settings-services.dart';
import 'package:devbey/view/widget/search-location/search-location-results-item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchLocationResultsOutput extends StatelessWidget {
  SearchLocationResultsOutput({Key? key}) : super(key: key);
  final SearchLocationController searchLocationController = Get.find();
  final SettingServices settingServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        controller: searchLocationController.scrollController,
        itemCount: searchLocationController.locations.length,
        itemBuilder: (ctx, index) {
          return SearchLocationResultsItem(
            itemSearch: searchLocationController.locations[index],
            isLTR: settingServices.getDirectionLTR(),
          );
        },
      ),
    );
  }
}
