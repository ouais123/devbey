import 'package:devbey/model/vehicle.dart';
import 'package:devbey/view/custom/adaptable-text.dart';
import 'package:devbey/view/widget/vehicles/vehicles-title-landscape.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VehiclesItemLandscape extends StatelessWidget {
  const VehiclesItemLandscape({Key? key, required this.vehicle})
      : super(key: key);
  final Vehicle vehicle;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    double width = size.width;
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: constraints.maxHeight * 0.9,
                child: Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.4,
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
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: constraints.maxWidth * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: constraints.maxHeight * 0.1,
                            ),
                            VehiclesTitleLandscape(
                              constraints: constraints,
                              icon: FluentIcons.icons_24_regular,
                              text: vehicle.brand.name,
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.05,
                            ),
                            VehiclesTitleLandscape(
                              constraints: constraints,
                              icon: FluentIcons.color_24_regular,
                              text: vehicle.color,
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.05,
                            ),
                            VehiclesTitleLandscape(
                              constraints: constraints,
                              icon: Icons.merge_type_rounded,
                              text: vehicle.transmission,
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.05,
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
                                        width: constraints.maxWidth * 0.08,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
