import 'package:e_commerce/base/model/product_model.dart';
import 'package:e_commerce/base/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../base/repository_impl/product_repository_impl.dart';

class DashboardController extends GetxController {
  final RemoteRepositoryImpl repository = RemoteRepositoryImpl();
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductModel> popularProductList = <ProductModel>[].obs;
  RxList<ProductModel> recentProductList = <ProductModel>[].obs;
  RxString textVal = "a".obs;
  final editingController = TextEditingController();

  void updateString() {
    textVal.value = editingController.text;
  }

  Future<void> fetchAndAppendProducts() async {
    try {
      final products = await repository.fetchProducts();
      productList.assignAll(products);
      splitProducts(); // Call split function after fetching products
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  void splitProducts() {
    if (productList.length >= 20) {
      popularProductList.assignAll(productList.sublist(0, 10));
      recentProductList.assignAll(productList.sublist(10, 20));
    } else {
      print("Insufficient products to split into popular and recent lists");
    }
  }
}
