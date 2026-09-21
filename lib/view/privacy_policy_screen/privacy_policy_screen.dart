import 'package:animate_do/animate_do.dart';
import 'package:deneme_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,

      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            FadeInUp(
              duration: const Duration(milliseconds: 200),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),

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
                      "Privacy Policy",
                      style: TextStyle(
                        color: AppColor.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// CONTENT
            Expanded(
              child: FadeInUp(
                duration: const Duration(milliseconds: 350),

                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),

                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          /// TITLE
                          Text(
                            "Your Privacy Matters",
                            style: TextStyle(
                              color: AppColor.green,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// TEXT
                          Text(
                            "We value your privacy and are committed to protecting your personal information. This app collects only the necessary information to improve your shopping experience.",

                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 15,
                              height: 1.7,
                            ),
                          ),

                          const SizedBox(height: 20),

                          Text(
                            "Your data will never be shared with third parties without your consent. We use secure technologies to keep your information safe and protected.",

                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 15,
                              height: 1.7,
                            ),
                          ),

                          const SizedBox(height: 20),

                          Text(
                            "By using this application, you agree to our privacy practices and terms of service.",

                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 15,
                              height: 1.7,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}