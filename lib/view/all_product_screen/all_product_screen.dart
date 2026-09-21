import 'package:animate_do/animate_do.dart';
import 'package:deneme_app/core/utils/app_color.dart';
import 'package:deneme_app/routes/app_routes.dart';
import 'package:deneme_app/view/all_product_screen/widget/all_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,

      body: ListView(
        padding: EdgeInsets.fromLTRB(19, 60, 16, 20),

        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 45,
                  width: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.green,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColor.white,
                    size: 20,
                  ),
                ),
              ),

              Expanded(
                child: Center(
                  child: Text(
                    "Chair",
                    style: TextStyle(
                      color: AppColor.green,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 45),
            ],
          ),

          const SizedBox(height: 20),

          /// PRODUCTS
          Column(
            children: List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),

                child: FadeInUp(
                  delay: Duration(milliseconds: 200 + (index * 100)),
                  duration: const Duration(milliseconds: 300),

                  child: AllProductCart(
                    onTap: () {
                      Get.toNamed(AppRoutes.productDetail);
                    },

                    name: "Modern Chair",
                    description: "Comfortable modern chair for your home.",
                    price: 34,
                    image: "assets/images/sofa.png",
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
