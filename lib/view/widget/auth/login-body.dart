import 'dart:developer';

import 'package:devbey/controller/login.dart';
import 'package:devbey/model/message-auth.dart';
import 'package:devbey/service/settings-services.dart';
import 'package:devbey/view/widget/app/app-progress.dart';
import 'package:devbey/view/widget/auth/button-auth.dart';
import 'package:devbey/view/widget/auth/input-auth.dart';
import 'package:devbey/view/widget/auth/not-auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);
  final SettingServices settingServices = Get.find();
  final LoginController loginController = Get.find();
  String email = "";
  String password = "";
  late bool isLTR;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    bool isLandscape = mediaQueryData.orientation == Orientation.landscape;
    isLTR = settingServices.getDirectionLTR();

    return Column(
      children: [
        AspectRatio(aspectRatio: isLandscape ? 12 / 1 : 3 / 1),
        AspectRatio(
          aspectRatio: isLandscape ? 8 / 1 : 4 / 1,
          child: Image.asset("assets/images/devbay-main.png"),
        ),
        AspectRatio(aspectRatio: isLandscape ? 12 / 1 : 4 / 1),
        Form(
          key: loginController.formStateLogin,
          child: Column(
            children: [
              InputAuth(
                title: "E-mail".tr,
                keyboardType: TextInputType.emailAddress,
                isoBscureText: false,
                validator: emailValidator,
                onSave: emailOnSave,
              ),
              AspectRatio(aspectRatio: isLandscape ? 30 / 1 : 18 / 1),
              Obx(
                () => InputAuth(
                  title: "Password".tr,
                  isoBscureText: loginController.isObscure.value,
                  suffixIcon: buildButtonBscure(),
                  validator: passwordValidator,
                  onSave: passwordOnSave,
                ),
              ),
            ],
          ),
        ),
        AspectRatio(aspectRatio: isLandscape ? 18 / 1 : 8 / 1),
        AspectRatio(
          aspectRatio: isLandscape ? 15 / 1 : 8 / 1,
          child: Obx(
            () => loginController.isLoading.value
                ? const AppProgress()
                : ButtonAuth(
                    title: "Login".tr,
                    onTap: login,
                  ),
          ),
        ),
        AspectRatio(
          aspectRatio: isLandscape ? 10 / 1 : 7 / 2,
        ),
        AspectRatio(
          aspectRatio: isLandscape ? 10 / 1 : 6 / 1,
          child: const NotAuth(),
        ),
      ],
    );
  }

  String? emailValidator(String? email) {
    if (email != null && email.isEmpty) return "you must be write E-mail".tr;

    if (email != null && !isEmail(email)) return "E-mail not vaild".tr;

    return null;
  }

  String? passwordValidator(String? password) {
    if (password != null && password.isEmpty)
      return "you must be write password".tr;

    if (password != null && password.length < 8)
      return "The password must be at least 8 characters".tr;

    return null;
  }

  void emailOnSave(String? email) {
    if (email != null) this.email = email;
  }

  void passwordOnSave(String? password) {
    if (password != null) this.password = password;
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  Padding buildButtonBscure() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 2.sp),
        child: InkWell(
          borderRadius: BorderRadius.circular(35.sp),
          onTap: () {
            loginController.isObscure.value = !loginController.isObscure.value;
          },
          child: Padding(
            padding: EdgeInsets.all(5.sp),
            child: Icon(
              loginController.isObscure.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ),
      );

  void login() async {
    FormState formState = loginController.formStateLogin.currentState!;
    if (!formState.validate()) return;

    formState.save();
    loginController.isLoading.value = true;

    MessageAuth messageAuth = await loginController.sigIn(email, password);
    if (messageAuth.isSuccess) {
      Get.offNamed("/search-vehicles");
    } else {
      Get.showSnackbar(buildGetSnackBar(
        messageAuth.message,
        Icons.error_outline_outlined,
      ));
    }

    loginController.isLoading.value = false;
  }

  GetSnackBar buildGetSnackBar(String message, IconData icon) => GetSnackBar(
        messageText: Text(
          message,
          textDirection: isLTR ? TextDirection.ltr : TextDirection.rtl,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 2, milliseconds: 900),
      );
}
