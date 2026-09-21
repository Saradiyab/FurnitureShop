import 'package:animate_do/animate_do.dart';
import 'package:deneme_app/core/utils/app_color.dart';
import 'package:deneme_app/routes/app_routes.dart';
import 'package:deneme_app/view/profile/widget/container_list.dart';
import 'package:deneme_app/widgets/alert_diyalog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,

      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 19),

        children: [
          /// TITLE
          FadeInUp(
            duration: const Duration(milliseconds: 200),
            child: Text(
              "Profile",
              style: TextStyle(
                color: AppColor.green,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// PROFILE CARD
          FadeInUp(
            duration: const Duration(milliseconds: 300),
            child: Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.08),
                  ),
                ],
              ),

              child: Column(
                children: [
                  /// IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),

                    child: Image.asset(
                      "assets/images/profile.jpg",
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// NAME
                  Text(
                    "Sara Mohammed",
                    style: TextStyle(
                      color: AppColor.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// EMAIL
                  Text(
                    "sara@gmail.com",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 25),

          /// PROFILE DETAILS
          FadeInUp(
            duration: const Duration(milliseconds: 400),
            child: ContainerList(
              title: 'Profile Details',
              icon: Icons.person_outline,
              onTap: () {
                Get.toNamed(AppRoutes.profileDetails);
              },
            ),
          ),

          const SizedBox(height: 20),

          /// MODE
          FadeInUp(
            duration: const Duration(milliseconds: 500),
            child: ContainerList(
              title: 'Dark Mode',
              icon: Icons.dark_mode_outlined,
            ),
          ),

          const SizedBox(height: 20),

          /// PRIVACY
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            child: ContainerList(
              onTap: () {
                Get.toNamed(AppRoutes.privacyPolicy);
              },
              title: 'Privacy Policy',
              icon: Icons.privacy_tip_outlined,
            ),
          ),

          const SizedBox(height: 20),

          /// LOGOUT
          FadeInUp(
            duration: const Duration(milliseconds: 700),
            child: ContainerList(
              onTap: () {
                Get.dialog(
                  AlertDiyalog(
                    title: "Logout",
                    description:
                        "Are you sure you want to log out of your account?",
                    onConfirm: () {
                      Get.toNamed(AppRoutes.signUp);
                    },
                  ),
                );
              },
              title: 'Logout',
              icon: Icons.logout_rounded,
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
