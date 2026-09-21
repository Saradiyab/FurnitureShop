import 'package:deneme_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async { 
  
  await GetStorage.init();
  runApp(const MyApp());
}

GetStorage data = GetStorage();
String token = "saas";


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.splashScreen,
      
      
     
      
     
    );
  }
}

