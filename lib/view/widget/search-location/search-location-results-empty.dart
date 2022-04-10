import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class SearchLocationResultsEmpty extends StatelessWidget {
  const SearchLocationResultsEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            FluentIcons.warning_24_regular,
            color: Colors.red,
            size: 120,
          ),
          Text(
            "No Result",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
