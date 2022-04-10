import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchVehiclesButton extends StatelessWidget {
  SearchVehiclesButton({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    double width = size.width;
    bool isLandscape = mediaQueryData.orientation == Orientation.landscape;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isLandscape ? width * 0.3 : width * 0.17),
      child: OutlinedButton.icon(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Colors.red.withOpacity(0.5),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0.h),
          ),
        ),
        icon: Icon(
          Icons.search,
          size: 25.sp,
        ),
        label: Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w300,
            fontFamily: "Raleway",
          ),
        ),
      ),
    );
  }
}
