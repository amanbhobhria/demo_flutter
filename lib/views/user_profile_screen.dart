import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Profile")),
      body: Obx(() {
        if (controller.isLoading.value && controller.profile.value == null) {
          return Center(child: CircularProgressIndicator());
        }

        final user = controller.profile.value;
        if (user == null) return Center(child: Text("No profile data"));

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Text(
                          user.name.toString()[0],
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          user.name ?? '',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 32),
                  _profileRow("Username", user.username),
                  _profileRow("Email", user.email),
                  _profileRow("Phone", user.phone),
                  _profileRow("Website", user.website),
                  _profileRow("Company", user.company?.name),
                  _profileRow("City", user.address?.city),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _profileRow(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text("$title: ", style: TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value ?? "-", overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
