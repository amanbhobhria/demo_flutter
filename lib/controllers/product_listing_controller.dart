import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_demo_flutter/model/product_list_response_model.dart';

import '../model/product_list_model.dart';

class ProductListingController extends GetxController {
  final String baseUrl = "https://dummyjson.com";
  final String endpoint = "/products";

  RxList<Products> products = <Products>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;

  RxList<Products> allProducts = <Products>[].obs;
  RxList<Products> filteredProducts = <Products>[].obs;

  RxString searchQuery = "".obs;

  Timer? debounce;

  @override
  void onInit() {
    super.onInit();
    hitListingApi();

    ever(searchQuery, (_) {
      debounce?.cancel();
      debounce = Timer(Duration(milliseconds: 400), () {
        applySearchFilter();
      });
    });
  }



  Future<void> hitListingApi() async {
    final dio = Dio();
    isLoading.value = true;
    errorMessage.value = "";

    try {
      final response = await dio.get("$baseUrl$endpoint");

      if (response.statusCode == 200) {
        final productList = ProductListResponseModel.fromJson(response.data);

        products.assignAll(productList.products ?? []);
        allProducts.assignAll(productList.products ?? []);
        filteredProducts.assignAll(productList.products ?? []);

        debugPrint("API call success. Total products: ${products.length}");
      } else {
        errorMessage.value =
        "Error: Received status code ${response.statusCode}";
      }
    } catch (e, st) {
      errorMessage.value = "Failed to fetch products: $e";
      debugPrint("❌ API Error: $e\n$st");
    } finally {
      isLoading.value = false;
    }
  }


  void applySearchFilter() {
    final query = searchQuery.value.toLowerCase();
    if (query.isEmpty) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(
        allProducts
            .where((p) => p.title.toLowerCase().contains(query))
            .toList(),
      );
    }
  }

  void toggleFavorite(int id) {
    final index = allProducts.indexWhere((p) => p.id == id);
    if (index != -1) {
      allProducts[index].isFavorite = !(allProducts[index].isFavorite);
      allProducts[index] = allProducts[index];
      applySearchFilter();
    }
  }

}
