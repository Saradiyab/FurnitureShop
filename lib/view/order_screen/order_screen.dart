import 'package:animate_do/animate_do.dart';
import 'package:deneme_app/view/order_screen/widget/order_item.dart';
import 'package:flutter/material.dart';
import 'package:deneme_app/core/utils/app_color.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,

      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            FadeInUp(
              duration: const Duration(milliseconds: 250),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                  vertical: 20,
                ),

                child: Row(
                  children: [
                    Text(
                      "Orders",
                      style: TextStyle(
                        color: AppColor.green,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// LIST
            Expanded(
              child: FadeInUp(
                duration: const Duration(milliseconds: 350),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 19,
                  ).copyWith(
                    bottom: 110,
                  ),

                  itemCount: 3,

                  itemBuilder: (context, index) {
                    return FadeInUp(
                      duration: Duration(
                        milliseconds: 250 + (index * 100),
                      ),

                      child: const OrderItem(
                        title: 'Sofa',
                        price: '34.00',
                        image: "assets/images/sofa.png",
                      ),
                    );
                  },
                ),
              ),
            ),

            /// TOTAL CARD
            FadeInUp(
              duration: const Duration(milliseconds: 500),
              child: Container(
                margin: const EdgeInsets.only(
                  left: 19,
                  right: 19,
                  bottom: 80,
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
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

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
            ),
          ],
        ),
      ),
    );
  }
}