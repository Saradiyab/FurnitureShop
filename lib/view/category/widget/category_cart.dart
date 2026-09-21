import 'package:flutter/material.dart';

class CategoryCart extends StatelessWidget {
  final String name;
  final String image;
  final void Function()? onTap;

  const CategoryCart({super.key, required this.name, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
      
        child: Stack(
          fit: StackFit.expand,
          children: [
            /// IMAGE (FULL COVER)
            Image.asset(image, fit: BoxFit.cover),
      
            /// DARK OVERLAY (shadow effect)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.05),
                    Colors.black.withValues(alpha: 0.6),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
      
            /// TEXT (NAME)
            Positioned(
              bottom: 40,
              left: 12,
              right: 12,
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
