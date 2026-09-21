import 'package:get/get.dart';

class ProductController extends GetxController {
  bool isFavorite = false;

  void toggleFavorite() {
    isFavorite = !isFavorite;
    update(); // UI refresh
  }
}