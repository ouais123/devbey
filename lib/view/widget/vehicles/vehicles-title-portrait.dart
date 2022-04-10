import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VehiclesTitlePortrait extends StatelessWidget {
  const VehiclesTitlePortrait({
    Key? key,
    required this.constraints,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final BoxConstraints constraints;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black.withOpacity(0.7),
          ),
          SizedBox(
            width: constraints.maxWidth * 0.01,
          ),
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
