import 'package:deneme_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDiyalog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onConfirm;

  const AlertDiyalog({
    super.key,
    required this.title,
    required this.description,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,

      child: Container(
        padding: const EdgeInsets.all(24),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// ICON
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: AppColor.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),

              child: Icon(
                Icons.check_rounded,
                color: AppColor.green,
                size: 45,
              ),
            ),

            const SizedBox(height: 20),

            /// TITLE
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.green,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            /// DESCRIPTION
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            /// BUTTONS
            Row(
              children: [
                /// CANCEL
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.back(),

                    child: Container(
                      height: 55,
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(18),
                      ),

                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                /// CONFIRM
                Expanded(
                  child: GestureDetector(
                    onTap: onConfirm,

                    child: Container(
                      height: 55,
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        color: AppColor.green,
                        borderRadius: BorderRadius.circular(18),
                      ),

                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}