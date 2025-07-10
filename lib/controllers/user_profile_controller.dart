

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_demo_flutter/model/user_profile_response_model.dart';
import 'package:my_demo_flutter/preferences/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UserProfileController extends GetxController {


  var profileApiUrl="https://jsonplaceholder.typicode.com/users/1";

SharedPreferences pref = SharedPreferences as SharedPreferences;
PreferenceManager preferenceManager =PreferenceManager();


  List<UserProfileResponseModel> list =UserProfileResponseModel() as List<UserProfileResponseModel>;


  @override
  void onInit() {
    hitProfileApi();
    super.onInit();
  }

  @override
  void onReady() {
    preferenceManager.getData();
    super.onReady();
  }

  Future<void> hitProfileApi() async {

    final dio = Dio();

    try{
      final response = await dio.get(profileApiUrl);
      list=response as List<UserProfileResponseModel>;

      preferenceManager.setData(list as UserProfileResponseModel);

      print("UserProfile api response = $response");

    }
    catch(e,st)
    {
      debugPrint("Api Error $e, $st");
    }




  }
}