import 'package:devbey/controller/vehicles.dart';
import 'package:devbey/view/widget/app/app-progress.dart';
import 'package:devbey/view/widget/vehicles/vehicles-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VehiclesBody extends StatelessWidget {
  VehiclesBody({Key? key}) : super(key: key);
  final VehiclesController vehiclesController = Get.find();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    bool isLandscape = mediaQueryData.orientation == Orientation.landscape;

    return Column(
      children: [
        AspectRatio(
          aspectRatio: isLandscape ? 10 / 1 : 5 / 1,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "Choose the right car",
              textAlign: TextAlign.center,
              style: buildTitleTextStyle(),
            ),
          ),
        ),
        AspectRatio(aspectRatio: isLandscape ? 30 / 1 : 12 / 1),
        Obx(
          () => ListView.builder(
            itemCount: vehiclesController.vehicles.length ==
                    vehiclesController.allVehicles.length
                ? vehiclesController.vehicles.length
                : vehiclesController.vehicles.length + 1,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              if (vehiclesController.vehicles.length == index)
                return AspectRatio(
                  aspectRatio: isLandscape ? 6 / 1 : 4 / 1,
                  child: const AppProgress(),
                );
              return VehiclesItem(vehicle: vehiclesController.vehicles[index]);
            },
          ),
        )
      ],
    );
  }

  TextStyle buildTitleTextStyle() {
    return TextStyle(
      fontSize: 25.sp,
      color: Colors.red,
      fontWeight: FontWeight.w400,
      fontFamily: "Lato",
    );
  }
}
