import 'package:deneme_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String image;
  final void Function()? onTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.image, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:0.06),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade100,
              ),
              child: Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
      
            const SizedBox(height: 8),
      
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColor.green,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
      
            const SizedBox(height: 4),
      
            /// DESCRIPTION
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 13,
                height: 1.4,
              ),
            ),
      
            const SizedBox(height: 8),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${price.toStringAsFixed(0)}",
                  style: TextStyle(
                    color: AppColor.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.green,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
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