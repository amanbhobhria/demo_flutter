

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_demo_flutter/model/product_list_response_model.dart';

import '../model/product_list_model.dart';

class ProductListingController extends GetxController {


  var baseUrl="'https://dummyjson.com";
  var productListingEndpoint="/products";


  List<ProductListResponseModel> list =ProductListResponseModel() as List<ProductListResponseModel>;
  List<Products> products = Products() as List<Products>;

  @override
  void onInit() {
    hitListingApi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> hitListingApi() async {

    final dio = Dio();

    try{
      final response = await dio.get("$baseUrl$productListingEndpoint");
      list=response as List<ProductListResponseModel>;

      print("Listing api response = $response");

    }
    catch(e,st)
    {
      debugPrint("Api Error $e, $st");
    }




  }
}