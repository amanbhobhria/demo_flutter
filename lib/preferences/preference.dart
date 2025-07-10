

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_profile_response_model.dart';



class PreferenceManager{
  SharedPreferences preferences = SharedPreferences as SharedPreferences;
  var argUserId="user_id";
  void setData(UserProfileResponseModel data ){
    preferences.setString(argUserId, data.id);
  }


  String? getData(){

    return preferences.getString(argUserId);
  }




}

