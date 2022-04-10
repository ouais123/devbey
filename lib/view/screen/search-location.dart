import 'dart:developer';

import 'package:devbey/controller/search-location.dart';
import 'package:devbey/view/widget/search-location/search-location-results-empty.dart';
import 'package:devbey/view/widget/search-location/search-location-results.dart';
import 'package:devbey/view/widget/search-location/search-location-suggestions.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchLocation extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = ThemeData(
      primarySwatch: redDark,
      inputDecorationTheme: searchFieldDecorationTheme,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.white70,
        selectionColor:
            const Color.fromARGB(255, 207, 181, 181).withOpacity(0.3),
        selectionHandleColor: Colors.white,
      ),
      textTheme: Theme.of(context).textTheme.copyWith(
            headline6: const TextStyle(color: Colors.white, fontSize: 18),
          ),
    );
    return theme;
  }

  @override
  String get searchFieldLabel => 'Search for location';

  @override
  InputDecorationTheme get searchFieldDecorationTheme =>
      const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white70),
        focusColor: Colors.white,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? const SearchLocationResultsEmpty()
        : SearchLocationResults(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SearchLocationSuggestions();
  }
}

const MaterialColor redDark = MaterialColor(
  0xFFC01007,
  <int, Color>{
    50: Color(0xFFC01007),
    100: Color(0xFFC01007),
    200: Color(0xFFC01007),
    300: Color(0xFFC01007),
    400: Color(0xFFC01007),
    500: Color(0xFFC01007),
    600: Color(0xFFC01007),
    700: Color(0xFFC01007),
    800: Color(0xFFC01007),
    900: Color(0xFFC01007),
  },
);
