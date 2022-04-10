import 'package:devbey/controller/search-vehicles.dart';
import 'package:devbey/model/item-search.dart';
import 'package:devbey/view/custom/adaptable-text.dart';
import 'package:devbey/view/widget/search-location/search-location-results-map.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import "package:latlong2/latlong.dart" as latLng;

class SearchLocationResultsItem extends StatelessWidget {
  SearchLocationResultsItem({
    Key? key,
    required this.itemSearch,
    required this.isLTR,
  }) : super(key: key);
  final SearchVehiclesController getVehiclesController = Get.find();
  final ItemSearch itemSearch;
  final bool isLTR;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    bool isLandscape = mediaQueryData.orientation == Orientation.landscape;
    return AspectRatio(
      aspectRatio: isLandscape ? 2.6 / 1 : 1.3 / 1,
      child: LayoutBuilder(
        builder: (ctx, constraints) => Container(
          margin: EdgeInsets.only(
            left: constraints.maxWidth * 0.02,
            right: constraints.maxWidth * 0.02,
            top: constraints.maxHeight * 0.08,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.005,
            vertical: constraints.maxHeight * 0.005,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.7),
            ),
            borderRadius: BorderRadius.circular(5.sp),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: constraints.maxHeight * 0.01,
                  horizontal: constraints.maxWidth * 0.005,
                ),
                child: InkWell(
                  onTap: () {
                    if (getVehiclesController.isClickPickupLocation)
                      getVehiclesController.selectPickup(itemSearch);
                    else
                      getVehiclesController.selectDelivery(itemSearch);

                    Get.back();
                  },
                  borderRadius: BorderRadius.circular(5.sp),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.01,
                      horizontal: constraints.maxWidth * 0.005,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FluentIcons.location_live_24_regular,
                          color: Colors.red,
                          size: 30.sp,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.02,
                        ),
                        Expanded(
                          child: Text(
                            "${itemSearch.country.name} ${itemSearch.asciiname}",
                            textDirection:
                                isLTR ? TextDirection.ltr : TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: "Lato",
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                  child: SearchLocationResultsMap(itemSearch: itemSearch),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
