import 'package:deneme_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class AllProductCart extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  final String name;
  final int price;
  final String description;

  const AllProductCart({
    super.key,
    this.onTap,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
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
              blurRadius: 20,
              spreadRadius: 1,
              offset: const Offset(0, 10),
              color: Colors.black.withOpacity(0.06),
            ),
          ],
        ),

        child: Row(
          children: [
            /// IMAGE
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: AppColor.background,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(width: 16),

            /// TEXTS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// NAME
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColor.green,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// DESCRIPTION
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColor.green.withOpacity(0.6),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 14),

                  /// PRICE + BUTTON
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$$price",
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

                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: AppColor.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}