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
      appBar: AppBar(
                title: Text("Products"),
        actions: [

          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Get.toNamed(AppRoutes.userProfileScreen); 
            },
          ),



          IconButton(
            icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => Get.changeThemeMode(
              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            ),
          ),


        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (value) => controller.searchQuery.value = value,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              final list = controller.filteredProducts;
              if (list.isEmpty) {
                return Center(child: Text("No products found"));
              }

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final product = list[index];
                  return ListTile(
                    leading: Image.network(product.thumbnail, width: 50, height: 50),
                    title: Text(product.title),
                    subtitle: Text("\$${product.price}"),
                    trailing: IconButton(
                      icon: Icon(
                        product.isFavorite == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: product.isFavorite == true ? Colors.red : null,
                      ),
                      onPressed: () => controller.toggleFavorite(product.id),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}



