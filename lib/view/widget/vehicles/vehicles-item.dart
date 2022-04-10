import 'package:devbey/model/vehicle.dart';

import 'package:devbey/view/widget/vehicles/vehicles-item-landscape.dart';
import 'package:devbey/view/widget/vehicles/vehicles-item-portrait.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VehiclesItem extends StatelessWidget {
  const VehiclesItem({Key? key, required this.vehicle}) : super(key: key);
  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    bool isLandscape = mediaQueryData.orientation == Orientation.landscape;
    return AspectRatio(
      aspectRatio: isLandscape ? 4 / 1 : 1.4 / 1,
      child: isLandscape
          ? VehiclesItemLandscape(vehicle: vehicle)
          : VehiclesItemPortrait(vehicle: vehicle),
    );
  }
}
