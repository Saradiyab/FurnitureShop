import 'package:animate_do/animate_do.dart';
import 'package:deneme_app/core/utils/app_color.dart';
import 'package:deneme_app/routes/app_routes.dart';
import 'package:deneme_app/view/category/widget/category_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 19, vertical: 60),
        children: [
          FadeInUp(
            duration: Duration(milliseconds: 150),
            child: Text(
              "Category",
              style: TextStyle(
                color: AppColor.green,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 20),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 20,
              childAspectRatio: 0.62,
            ),

            itemBuilder: (context, index) {
              return FadeInUp(
                delay: Duration(milliseconds: 200 + (index * 100)),
                duration: const Duration(milliseconds: 300),
                child: CategoryCart(
                  onTap: () {
                    Get.toNamed(AppRoutes.allProduct);
                  },
                  name: "Modern Chair",

                  image: "assets/images/splash.png",
                ),
              );
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
