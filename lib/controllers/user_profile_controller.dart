import 'dart:convert';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_profile_response_model.dart';


class UserProfileController extends GetxController {
  final String profileApiUrl = "https://jsonplaceholder.typicode.com/users/1";

  Rx<UserProfileResponseModel?> profile = Rx<UserProfileResponseModel?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfileFromPrefs(); // Load from prefs on init
    hitProfileApi();        // Then refresh from API
  }

  Future<void> hitProfileApi() async {
    isLoading.value = true;

    try {
      final response = await Dio().get(profileApiUrl);
      if (response.statusCode == 200) {
        final data = UserProfileResponseModel.fromJson(response.data);
        profile.value = data;

        // 🔐 Save to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('user_profile', jsonEncode(response.data));
      }
    } catch (e) {
      print("API Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadProfileFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('user_profile');
    if (jsonString != null) {
      profile.value = UserProfileResponseModel.fromJson(jsonDecode(jsonString));
    }
  }
}
