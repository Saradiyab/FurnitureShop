import 'package:deneme_app/core/function/crud.dart';
import 'package:deneme_app/core/utils/app_api.dart';
import 'package:deneme_app/main.dart';
import 'package:deneme_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  Crud crud = Crud();

  bool isLoading = false;
  bool isPasswordVisible = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  Future<void> postLogin() async {
    isLoading = true;
    update();

    try {
      var response = await crud.postRequest(AppApi.logIn, {
        'email': email.text.trim(),
        'password': password.text,
        'token': token, // eğer backend istiyorsa
      });

      if (response != null && response["status"] == "success") {
        data.write('access_token', response['access_token'].toString());
        data.write('refresh_token', response['refresh_token'].toString());
        data.write('user', response['data']);

        Get.offAllNamed(AppRoutes.homeScreen); 
      } else {
        Get.snackbar(
          "Login Failed",
          response?["message"] ?? "Something went wrong",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    data.write('onboarding', "1");

    if (data.hasData('saved_email')) {
      email.text = data.read('saved_email');
      password.text = data.read('saved_password');
    }
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}