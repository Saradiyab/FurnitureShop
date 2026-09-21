import 'package:animate_do/animate_do.dart';
import 'package:deneme_app/core/utils/app_color.dart';
import 'package:deneme_app/routes/app_routes.dart';
import 'package:deneme_app/widgets/app_button.dart';
import 'package:deneme_app/widgets/text_faild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 60),
        children: [

          const SizedBox(height: 20),

          FadeInUp(
            delay: const Duration(milliseconds: 50),
            child: Text(
              "Create your account",
              style: TextStyle(
                color: AppColor.green,
                fontWeight: FontWeight.w700,
                fontSize: 26,
              ),
            ),
          ),

          const SizedBox(height: 30),

          /// USERNAME
          FadeInUp(
            delay: const Duration(milliseconds: 150),
            child: AppTextField(labelText: 'Username'),
          ),

          const SizedBox(height: 20),

          /// EMAIL
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: AppTextField(labelText: 'Email'),
          ),

          const SizedBox(height: 20),

          /// PASSWORD
          FadeInUp(
            delay: const Duration(milliseconds: 250),
            child: AppTextField(labelText: 'Password'),
          ),

          const SizedBox(height: 30),

          /// SIGN UP BUTTON
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: AppButton(
              title: 'Sign Up',
              onTap: () {
                Get.offAllNamed(AppRoutes.homeScreen);
              },
            ),
          ),

          const SizedBox(height: 20),

          /// LOGIN LINK
          FadeInUp(
            delay: const Duration(milliseconds: 350),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: AppColor.green),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}