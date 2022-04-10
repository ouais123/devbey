import 'package:flutter/material.dart';

class AppTapBar extends StatelessWidget {
  const AppTapBar({
    Key? key,
    required this.leftIconData,
    required this.rightIconData,
    required this.leftOnTap,
    required this.rightOnTap,
  }) : super(key: key);
  final IconData leftIconData;
  final IconData rightIconData;
  final void Function() leftOnTap;
  final void Function() rightOnTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: leftOnTap,
          icon: Icon(
            leftIconData,
            color: Colors.red,
          ),
        ),
        IconButton(
          onPressed: rightOnTap,
          icon: Icon(
            rightIconData,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
