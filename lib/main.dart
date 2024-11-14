import 'package:e_commerce/modules/dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce/modules/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final DashboardController homeCtrl = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

