import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo_flutter/controllers/timeline_controller.dart';
import 'package:my_demo_flutter/routes/app_routes.dart';
import 'package:my_demo_flutter/views/demo_snackbar_screen.dart';
import 'package:my_demo_flutter/views/timeline_screen.dart';

import 'controllers/demo_snackbar_controller.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Face Detection App',
      initialRoute: AppRoutes.timeLineScreen,
      getPages: [
        GetPage(
          name: AppRoutes.timeLineScreen,
          page: () => TimelineScreen(),
          binding: BindingsBuilder(() {
            Get.put(TimelineController());
          }),
        ),
      ],
    );
  }
}