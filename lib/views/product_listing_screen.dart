import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_demo_flutter/controllers/product_listing_controller.dart';
import 'package:my_demo_flutter/routes/app_routes.dart';

class ProductListingScreen extends StatelessWidget {
  final controller = Get.put(ProductListingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () =>{
            Get.toNamed(AppRoutes.userProfileScreen)
          }
        ));

  }
}


