import 'package:deneme_app/view/order_screen/widget/order_item.dart';
import 'package:flutter/material.dart';
import 'package:deneme_app/core/utils/app_color.dart';
import 'package:get/get.dart';

class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,

      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 19,
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
                        borderRadius: BorderRadius.circular(16),
                        color: AppColor.green,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "Orders",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 45),
                ],
              ),
            ),

            /// LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                ).copyWith(
                  bottom: 110, // 👈 NAVBAR SAFE SPACE
                ),

                itemCount: 3,
                itemBuilder: (context, index) {
                  return const OrderItem(
                    title: 'Sofa',
                    price: '34.00',
                    image: "assets/images/sofa.png",
                  );
                },
              ),
            ),

            /// TOTAL CARD (FIXED ABOVE NAVBAR)
            Container(
              margin: const EdgeInsets.only(
                left: 19,
                right: 19,
                bottom: 10, 
              ),

              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),

              decoration: BoxDecoration(
                color: AppColor.green,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Text(
                    "\$34.00",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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