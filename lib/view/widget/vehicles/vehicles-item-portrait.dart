import 'package:devbey/model/vehicle.dart';
import 'package:devbey/view/custom/adaptable-text.dart';
import 'package:devbey/view/widget/vehicles/vehicles-title-portrait.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VehiclesItemPortrait extends StatelessWidget {
  const VehiclesItemPortrait({Key? key, required this.vehicle})
      : super(key: key);
  final Vehicle vehicle;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.75,
              width: constraints.maxWidth * 1,
              child: Opacity(
                opacity: 0.9,
                child: FadeInImage.assetNetwork(
                  image: vehicle.photos,
                  placeholder: "assets/images/background.png",
                  alignment: Alignment.center,
                  fadeOutCurve: Curves.easeOut,
                  fadeInCurve: Curves.easeIn,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.25,
              margin:
                  EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.03,
                  ),
                  Row(
                    children: [
                      VehiclesTitlePortrait(
                        constraints: constraints,
                        icon: FluentIcons.icons_24_regular,
                        text: vehicle.brand.name,
                      ),
                      VehiclesTitlePortrait(
                        constraints: constraints,
                        icon: FluentIcons.color_24_regular,
                        text: vehicle.color,
                      ),
                      VehiclesTitlePortrait(
                        constraints: constraints,
                        icon: Icons.merge_type_rounded,
                        text: vehicle.transmission,
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: vehicle.prices.length,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            AdaptableText(
                              "US \$ ${vehicle.prices[index].price} / ${vehicle.prices[index].numOfDays} Days",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.1,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.020,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
