import 'package:devbey/controller/personal.dart';
import 'package:devbey/view/widget/drawer/personal-item-drawer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoDrawer extends StatelessWidget {
  PersonalInfoDrawer({Key? key}) : super(key: key);
  final PersonalController personalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonalItemDrawer(
          text: "Phone",
          subTitle: personalController.personalIfo.phone,
          icon: FluentIcons.phone_24_regular,
        ),
        PersonalItemDrawer(
          text: "Gender",
          subTitle: personalController.personalIfo.gender,
          icon: FluentIcons.person_24_regular,
        ),
        PersonalItemDrawer(
          text: "Nationality",
          subTitle: personalController.personalIfo.nationality,
          icon: FluentIcons.flag_24_regular,
        ),
        PersonalItemDrawer(
          text: "Address",
          subTitle: personalController.personalIfo.address,
          icon: FluentIcons.location_24_regular,
        ),
        PersonalItemDrawer(
          text: "Residence number",
          subTitle: personalController.personalIfo.residenceNumber,
          icon: FluentIcons.number_row_24_regular,
        ),
        PersonalItemDrawer(
          text: "Residence expiry",
          subTitle: personalController.personalIfo.residenceExpiry,
          icon: FluentIcons.shield_error_24_regular,
        ),
        PersonalItemDrawer(
          text: "Passport number",
          subTitle: personalController.personalIfo.passportNumber,
          icon: FluentIcons.airplane_24_regular,
        ),
        PersonalItemDrawer(
          text: "Passport expiry",
          subTitle: personalController.personalIfo.passportExpiry,
          icon: FluentIcons.airplane_take_off_24_regular,
        ),
        PersonalItemDrawer(
          text: "License number",
          subTitle: personalController.personalIfo.licenseNumber,
          icon: Icons.car_rental_outlined,
        ),
        PersonalItemDrawer(
          text: "License type",
          subTitle: personalController.personalIfo.licenseType,
          icon: Icons.merge_type_outlined,
        ),
        PersonalItemDrawer(
          text: "License expiry",
          subTitle: personalController.personalIfo.licenseExpiry,
          icon: FluentIcons.people_error_24_regular,
        ),
      ],
    );
  }
}
