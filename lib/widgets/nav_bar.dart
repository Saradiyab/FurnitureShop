import 'package:animate_do/animate_do.dart';
import 'package:deneme_app/core/utils/app_color.dart';
import 'package:deneme_app/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.background,

          body: Stack(
            children: [
              controller.screens[controller.selectedIndex],

              /// NAVBAR
              Positioned(
                left: 0,
                right: 0,
                bottom: 24,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 400),
                    child: Container(
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha:0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) {
                          final isSelected =
                              controller.selectedIndex == index;

                          return GestureDetector(
                            onTap: () =>
                                controller.onTabTapped(index),

                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.symmetric(
                                horizontal: isSelected ? 14 : 0,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColor.green
                                    : Colors.transparent,
                                borderRadius:
                                    BorderRadius.circular(16),
                              ),

                              child: Row(
                                children: [
                                  Icon(
                                    controller.icons[index],
                                    size: 26,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey,
                                  ),

                                  if (isSelected) ...[
                                    const SizedBox(width: 6),
                                    Text(
                                      controller.labels[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
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
}