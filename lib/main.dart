import 'package:e_commerce/modules/cart/cart_screen.dart';
import 'package:e_commerce/modules/dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce/modules/dashboard/view/dashboard_screen.dart';
import 'package:e_commerce/modules/detail/view/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/cart/controller/cart_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final DashboardController homeCtrl = Get.put(DashboardController());
  final CartController cartCtrl = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: _routes,
      title: 'E Commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DashboardScreen(),
    );
  }
}

final List<GetPage> _routes = [
  GetPage(name: '/home', page: () => DashboardScreen()),
  GetPage(name: '/details', page: () => ProductDetailsScreen()),
  GetPage(name: '/cart', page: () => CartScreen()),
];
