import 'package:devbey/service/settings-services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InternetError extends StatelessWidget {
  InternetError({
    Key? key,
    required this.margen,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  final SettingServices settingServices = Get.find();
  String text;
  IconData icon;
  Function onTap;
  Color color;
  Color textColor;
  double margen;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    double width = size.width;
    double height = size.height;
    bool isLandscape = mediaQueryData.orientation == Orientation.landscape;
    bool isLTR = settingServices.getDirectionLTR();
    return Center(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: margen,
              ),
              Icon(
                icon,
                color: color,
                size: 140,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: isLandscape ? width * 0.05 : width * 0.1,
                    vertical: isLandscape ? height * 0.05 : height * 0.02),
                child: Text(
                  text,
                  style: TextStyle(color: color, fontSize: 18.sp),
                  textAlign: TextAlign.center,
                  textDirection: isLTR ? TextDirection.ltr : TextDirection.rtl,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white70,
                  primary: color,
                  padding: EdgeInsets.symmetric(
                    vertical: isLandscape ? height * 0.04 : height * 0.015,
                    horizontal: isLandscape ? width * 0.05 : width * 0.08,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.1),
                  ),
                ),
                onPressed: () {
                  onTap();
                },
                child: Text(
                  "Try again".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: margen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
