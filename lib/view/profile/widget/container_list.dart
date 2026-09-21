import 'package:deneme_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class ContainerList extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const ContainerList({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 14,
        ),

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

        child: Row(
          children: [
            Icon(
              icon,
              color: AppColor.green,
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColor.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColor.green,
            ),
          ],
        ),
      ),
    );
  }
}