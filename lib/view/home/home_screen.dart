import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:deneme_app/core/utils/app_color.dart';
import 'package:deneme_app/routes/app_routes.dart';
import 'package:deneme_app/view/home/widget/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List banners = [
    {
      "image": "assets/images/sofa2.jpg",
    },
    {
      "image": "assets/images/splash.png",
    },
    {
      "image": "assets/images/sofa2.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// HEADER
              FadeInUp(
                duration: const Duration(milliseconds: 300),

                child: Row(
                  children: [
                    Text(
                      "Discover The Best\nFurniture.",
                      style: TextStyle(
                        color: AppColor.green,
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        height: 1.2,
                      ),
                    ),

                    const Spacer(),

                    Container(
                      height: 60,
                      width: 60,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/profile.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// SEARCH
              FadeInUp(
                delay: const Duration(milliseconds: 100),
                duration: const Duration(milliseconds: 300),

                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search furniture...",
                    prefixIcon: const Icon(Icons.search),

                    filled: true,
                    fillColor: Colors.white,

                    contentPadding:
                        const EdgeInsets.symmetric(
                          vertical: 18,
                        ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// BANNER SLIDER
              FadeInUp(
                delay: const Duration(milliseconds: 150),
                duration: const Duration(milliseconds: 300),

                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: banners.length,

                      itemBuilder:
                          (context, index, realIndex) {
                        final image =
                            banners[index]['image'];

                        return Container(
                          width: double.infinity,

                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(24),

                            image: DecorationImage(
                              image: AssetImage(image),
                              fit: BoxFit.cover,
                            ),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.08),
                                blurRadius: 12,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),

                          child: Container(
                            padding: const EdgeInsets.all(20),

                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(24),

                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(
                                    0.45,
                                  ),
                                  Colors.transparent,
                                ],

                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),

                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              mainAxisAlignment:
                                  MainAxisAlignment.end,

                              children: [
                                const Text(
                                  "New Collection",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  "Up to 40% discount",
                                  style: TextStyle(
                                    color: Colors.white
                                        .withOpacity(0.9),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },

                      options: CarouselOptions(
                        height: 180,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.92,

                        onPageChanged: (
                          index,
                          reason,
                        ) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: List.generate(
                        banners.length,
                        (index) {
                          final isActive =
                              currentIndex == index;

                          return AnimatedContainer(
                            duration:
                                const Duration(
                                  milliseconds: 300,
                                ),

                            margin:
                                const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),

                            width: isActive ? 24 : 8,
                            height: 8,

                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppColor.green
                                  : Colors.grey.shade300,

                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// TITLE
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 300),

                child: Text(
                  "Products",
                  style: TextStyle(
                    color: AppColor.green,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// PRODUCT GRID
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),

                itemCount: 4,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.62,
                    ),

                itemBuilder: (context, index) {
                  return FadeInUp(
                    delay: Duration(
                      milliseconds: 250 + (index * 100),
                    ),

                    duration:
                        const Duration(milliseconds: 300),

                    child: ProductCard(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.productDetail,
                        );
                      },

                      title: "Modern Chair",

                      description:
                          "Comfortable modern chair for your home.",

                      price: 120,

                      image:
                          "assets/images/sofa.png",
                    ),
                  );
                },
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}