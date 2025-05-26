import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DemoSnackBarController extends GetxController {

   void showSimpleSnackbar() {

    var snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message:
        'This is an example error message that will be shown in the body of snackbar!',
        contentType: ContentType.failure,
      ),
    );

    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      debugPrint("Context is null. Ensure you call this after widget tree is built.");
    }

  }

  void showSuccessSnackbar() {
    Get.snackbar(
      "Success",
      "The operation completed successfully!",
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  void showErrorSnackbar() {
    Get.snackbar(
      "Error",
      "Something went wrong!",
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  void showWarningSnackbar() {
    Get.snackbar(
      "Warning",
      "This is a warning message!",
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void showCustomSnackbar() {
    Get.snackbar(
      "Custom Snackbar",
      "With icon and shadow.",
      icon: const Icon(Icons.info, color: Colors.white),
      backgroundColor: Colors.indigo,
      colorText: Colors.white,
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  
}
