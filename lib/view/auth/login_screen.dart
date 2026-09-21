import 'package:animate_do/animate_do.dart';
import 'package:deneme_app/core/utils/app_color.dart';
import 'package:deneme_app/routes/app_routes.dart';
import 'package:deneme_app/view/auth/controller/login_controller.dart';
import 'package:deneme_app/widgets/app_button.dart';
import 'package:deneme_app/widgets/text_faild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
      init: LogInController(),

      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.background,

          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),

              children: [
                const SizedBox(height: 10),

                /// TOP TEXT
                FadeInDown(
                  duration: const Duration(milliseconds: 400),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back 👋",
                        style: TextStyle(
                          color: AppColor.green,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Login to continue shopping with us.",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// ANIMATION CARD
                FadeInUp(
                  duration: const Duration(milliseconds: 500),

                  child: Container(
                    height: 240,
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),

                    child: Lottie.asset(
                      "assets/images/login.json",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                /// EMAIL
                FadeInUp(
                  duration: const Duration(milliseconds: 600),

                  child: AppTextField(
                    labelText: "Email Address",
                    controller: controller.email,

                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColor.green,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// PASSWORD
                FadeInUp(
                  duration: const Duration(milliseconds: 700),

                  child: AppTextField(
                    labelText: "Password",
                    controller: controller.password,
                    obscureText: !controller.isPasswordVisible,

                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColor.green,
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColor.green,
                      ),

                      onPressed:
                          controller.togglePasswordVisibility,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// FORGOT PASSWORD
                FadeInUp(
                  duration: const Duration(milliseconds: 750),

                  child: Align(
                    alignment: Alignment.centerRight,

                    child: TextButton(
                      onPressed: () {},

                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: AppColor.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// LOGIN BUTTON
                FadeInUp(
                  duration: const Duration(milliseconds: 800),

                  child: AppButton(
                    title: "Login",

                    onTap: () {
                      Get.toNamed(AppRoutes.homeScreen);
                    },
                  ),
                ),

                const SizedBox(height: 30),

                /// DIVIDER
                FadeInUp(
                  duration: const Duration(milliseconds: 850),

                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),

                        child: Text(
                          "OR",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// GOOGLE BUTTON
                FadeInUp(
                  duration: const Duration(milliseconds: 900),

                  child: Container(
                    height: 58,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Image.asset(
                          "assets/images/google.jpg",
                          height: 24,
                        ),

                        const SizedBox(width: 12),

                        Text(
                          "Continue with Google",
                          style: TextStyle(
                            color: AppColor.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// SIGNUP
                FadeInUp(
                  duration: const Duration(milliseconds: 1000),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.signUp);
                        },

                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColor.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}