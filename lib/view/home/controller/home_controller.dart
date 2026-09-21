import 'package:deneme_app/view/category/category_screen.dart';
import 'package:deneme_app/view/home/home_screen.dart';
import 'package:deneme_app/view/order_screen/order_screen.dart';
import 'package:deneme_app/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int selectedIndex = 0;

  void onTabTapped(int index) {
    selectedIndex = index;
    update();
  }

  /// SCREENS (4 TAB)
  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  List<IconData> icons = [
  Icons.home,
  Icons.category,
  Icons.shopping_cart,
  Icons.person,
];
  /// LABELS
  List<String> labels = [
    "Home",
    "Category",
    "Order",
    "Profile",
  ];
}