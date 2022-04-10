import 'package:devbey/locale/locale-app.dart';
import 'package:devbey/locale/locale-controller.dart';
import 'package:devbey/service/settings-services.dart';
import 'package:devbey/view/screen/Vehicles.dart';
import 'package:devbey/view/screen/search-vehicles.dart';
import 'package:devbey/view/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServives();
  runApp(MyApp());
}

Future<void> initalServives() async {
  await Get.putAsync(() => SettingServices().init());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final LocaleController localeController = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0.95),
      ),
    );
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => GetMaterialApp(
        title: 'Devbey',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        locale: const Locale("en"), //localeController.localeApp,
        translations: LocaleApp(),
        getPages: [
          GetPage(
            name: "/",
            page: () => Login(),
            transitionDuration: const Duration(milliseconds: 350),
            transition: Transition.fadeIn,
          ),
          GetPage(
            name: "/search-vehicles",
            page: () => SearchVehicles(),
            transitionDuration: const Duration(milliseconds: 350),
            transition: Transition.fadeIn,
          ),
          GetPage(
            name: "/search-vehicles/vehicles",
            page: () => Vehicles(),
            transitionDuration: const Duration(milliseconds: 350),
            transition: Transition.fadeIn,
          ),
        ],
      ),
    );
  }
}
