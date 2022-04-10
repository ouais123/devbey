import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotAuth extends StatelessWidget {
  const NotAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "If you are not registered ".tr,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            "Click here!".tr,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
