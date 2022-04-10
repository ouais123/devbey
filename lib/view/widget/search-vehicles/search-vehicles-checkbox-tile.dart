import 'package:devbey/controller/search-vehicles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchVehiclesChecknox extends StatelessWidget {
  SearchVehiclesChecknox({Key? key}) : super(key: key);
  final SearchVehiclesController getVehiclesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrained) => Padding(
        padding: EdgeInsets.symmetric(horizontal: constrained.maxWidth * 0.1),
        child: Obx(
          () => CheckboxListTile(
            title: Text(
              "Return to a different location",
              style: buildInputTitleTextStyle(),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: constrained.maxWidth * 0.005,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            dense: true,
            value: getVehiclesController.isReturnLocation.value,
            onChanged: (val) {
              getVehiclesController.isReturnLocation.value =
                  !getVehiclesController.isReturnLocation.value;
            },
          ),
        ),
      ),
    );
  }

  TextStyle buildInputTitleTextStyle() {
    return TextStyle(
      color: Colors.grey,
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
    );
  }
}
