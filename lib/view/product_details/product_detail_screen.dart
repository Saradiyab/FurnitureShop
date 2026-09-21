import 'package:animate_do/animate_do.dart';
import 'package:deneme_app/core/utils/app_color.dart';
import 'package:deneme_app/routes/app_routes.dart';
import 'package:deneme_app/view/product_details/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xffF5F5F5),

          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: double.infinity,

                child: Stack(
                  children: [
                    /// GREEN BACKGROUND
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColor.green,
                            AppColor.green.withValues(alpha: 0.75),
                          ],
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                    ),

                    Positioned(
                      top: -60,
                      right: -60,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.08),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: -70,
                      left: -50,
                      child: Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.06),
                        ),
                      ),
                    ),

                    /// CENTER IMAGE
                    Center(
                      child: Hero(
                        tag: "product",

                        child: FadeIn(
                          duration: const Duration(milliseconds: 400),

                          child: Container(
                            padding: const EdgeInsets.all(28),

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.15),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.25),
                              ),
                            ),

                            child: Image.asset(
                              "assets/images/sofa.png",
                              height: 210,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// TOP BUTTONS
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),

                              child: Container(
                                height: 48,
                                width: 48,
                                alignment: Alignment.center,

                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(16),
                                ),

                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: controller.toggleFavorite,

                              child: Container(
                                height: 48,
                                width: 48,
                                alignment: Alignment.center,

                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(16),
                                ),

                                child: Icon(
                                  controller.isFavorite
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_rounded,

                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,

                child: FadeInUp(
                  duration: const Duration(milliseconds: 400),

                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.48,
                    width: double.infinity,

                    padding: const EdgeInsets.fromLTRB(24, 30, 24, 24),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(38),
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 30,
                          offset: const Offset(0, -10),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Modern Sofa",
                                style: TextStyle(
                                  color: AppColor.green,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                ),
                              ),
                            ),

                            Text(
                              "\$240",
                              style: TextStyle(
                                color: AppColor.green,
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Text(
                          "A stylish and comfortable modern sofa designed with premium materials for elegant and modern living spaces.",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                            height: 1.8,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 28),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildInfoCard(Icons.star_rounded, "4.9"),
                            _buildInfoCard(
                              Icons.local_shipping_rounded,
                              "Free",
                            ),
                            _buildInfoCard(Icons.access_time_rounded, "24h"),
                          ],
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          width: double.infinity,
                          height: 62,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.green,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: () {Get.toNamed(AppRoutes.addToCart);},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoCard(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColor.green),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: AppColor.green,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
