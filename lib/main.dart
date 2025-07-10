import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_demo_flutter/routes/app_routes.dart';
import 'package:my_demo_flutter/viewmodel/splash_view_model.dart';
import 'package:my_demo_flutter/views/product_listing_screen.dart';
import 'package:my_demo_flutter/views/splash_screen.dart';
import 'package:my_demo_flutter/views/user_profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: AppRoutes.productListingScreen,
    getPages: [
      GetPage(name: AppRoutes.productListingScreen, page: () => ProductListingScreen()),
      GetPage(name: AppRoutes.userProfileScreen, page: () => ProfileScreen()),
    ],
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.system,
  ));
}


class ThemeController extends GetxController {
  var isDark = false.obs;

  void toggleTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }}



