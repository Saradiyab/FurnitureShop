import 'package:flutter/material.dart';
import 'package:deneme_app/core/utils/app_color.dart';

class OrderItem extends StatelessWidget {
  final String title;
  final String price;
    final String image;


  const OrderItem({
    super.key,
    required this.title,
    required this.price, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [
          /// ICON
          Container(
            padding: EdgeInsets.all(4),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: AppColor.green.withValues( alpha:0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(image)
          ),

          const SizedBox(width: 15),

          /// INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "\$$price",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          /// STATUS
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: AppColor.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              " Remove",
              style: TextStyle(
                color: const Color.fromARGB(255, 193, 79, 71),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}