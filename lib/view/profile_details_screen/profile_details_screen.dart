import 'package:animate_do/animate_do.dart';
import 'package:deneme_app/core/utils/app_color.dart';
import 'package:deneme_app/widgets/alert_diyalog.dart';
import 'package:deneme_app/widgets/app_button.dart';
import 'package:deneme_app/widgets/text_faild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

          children: [
            /// HEADER
            FadeInUp(
              duration: const Duration(milliseconds: 200),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),

                    child: Container(
                      height: 45,
                      width: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColor.green,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),

                  const SizedBox(width: 50),

                  Text(
                    "Profile Details",
                    style: TextStyle(
                      color: AppColor.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// PROFILE IMAGE
            FadeInUp(
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/profile.jpg"),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColor.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// NAME
            FadeInUp(
              duration: const Duration(milliseconds: 400),
              child: const AppTextField(
                labelText: "Full Name",
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),

            const SizedBox(height: 20),

            /// EMAIL
            FadeInUp(
              duration: const Duration(milliseconds: 500),
              child: const AppTextField(
                labelText: "Email",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),

            const SizedBox(height: 20),

            /// PHONE
            FadeInUp(
              duration: const Duration(milliseconds: 600),
              child: const AppTextField(
                labelText: "Phone Number",
                keyboardType: TextInputType.phone,
                prefixIcon: Icon(Icons.phone_outlined),
              ),
            ),

            const SizedBox(height: 20),

            /// ADDRESS
            FadeInUp(
              duration: const Duration(milliseconds: 700),
              child: const AppTextField(
                labelText: "Address",
                maxLines: 3,
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
            ),

            const SizedBox(height: 40),

            /// SAVE BUTTON
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: AppButton(
                title: "Save Changes",

                onTap: () {
                  Get.dialog(
                    AlertDiyalog(
                      title: "Profile Updated",
                      description:
                          "Your profile information has been updated successfully.",

                      onConfirm: () {
                        Get.back();
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
