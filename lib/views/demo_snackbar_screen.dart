import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/demo_snackbar_controller.dart';




class DemoSnackbarScreen extends StatelessWidget {
  final DemoSnackBarController controller = Get.put(DemoSnackBarController());

  DemoSnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar Demo"),
        backgroundColor: Colors.teal,
      ),
    body: SingleChildScrollView(

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildButton("Success Banner", Colors.teal, () =>showBanner(ContentType.success)),
            _buildButton("Failure Banner", Colors.teal,() => showBanner(ContentType.failure)),
            _buildButton("Help Banner", Colors.teal,() => showBanner(ContentType.help)),
            _buildButton("Warning Banner", Colors.red,() =>showBanner(ContentType.warning)),

            _buildButton("Failure Snackbar", Colors.red,()=> showSnackbar( ContentType.failure)),
            _buildButton("Warning Snackbar", Colors.teal,()=> showSnackbar( ContentType.warning)),
            _buildButton("Help Snackbar", Colors.green,()=> showSnackbar( ContentType.help)),
            _buildButton("success Snackbar", Colors.yellow,()=> showSnackbar( ContentType.success)),

          ],
        ),
      ),
    ),
    );
  }

  Widget _buildButton(String label, Color color, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  void showSnackbar(type) {
    var snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message:
        'This is an example message that will be shown in the body of snackbar!',
        contentType:type,
      ),
    );


    ScaffoldMessenger.of(Get.context!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);


  }


   showBanner( type) {
     var materialBanner = MaterialBanner(

       elevation: 0,
       backgroundColor: Colors.transparent,
       forceActionsBelow: true,
       content: AwesomeSnackbarContent(
         title: 'Oh Hey!!',
         message:
         'This is an example  message that will be shown in the body of materialBanner!',

         /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
         contentType: type,
         // to configure for material banner
         inMaterialBanner: true,
       ),
       actions: const [SizedBox.shrink()],
     );


     if (Get.context != null) {
       ScaffoldMessenger.of(Get.context!)
         ..hideCurrentMaterialBanner()
         ..showMaterialBanner(materialBanner);
     } else {
       debugPrint("Get.context is null");
     }
   }}