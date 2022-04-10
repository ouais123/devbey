import 'package:devbey/service/settings-services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalItemDrawer extends StatelessWidget {
  final SettingServices settingServices = Get.find();
  PersonalItemDrawer({
    Key? key,
    required this.text,
    required this.subTitle,
    required this.icon,
  }) : super(key: key);

  String text;
  String subTitle;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.red,
          size: 30.sp,
        ),
        title: Text(
          text,
          textDirection: settingServices.getDirectionLTR()
              ? TextDirection.ltr
              : TextDirection.rtl,
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: "RobotoCondensed",
            color: Colors.red,
          ),
        ),
        subtitle: Text(
          subTitle,
          textDirection: settingServices.getDirectionLTR()
              ? TextDirection.ltr
              : TextDirection.rtl,
          style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 12.sp,
            color: Colors.red.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
