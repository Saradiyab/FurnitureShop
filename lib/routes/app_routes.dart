import 'package:deneme_app/view/add_to_cart/add_to_cart_screen.dart';
import 'package:deneme_app/view/all_product_screen/all_product_screen.dart';
import 'package:deneme_app/view/auth/login_screen.dart';
import 'package:deneme_app/view/auth/sign_up_screen.dart';
import 'package:deneme_app/view/category/category_screen.dart';
import 'package:deneme_app/view/order_screen/order_screen.dart';
import 'package:deneme_app/view/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:deneme_app/view/product_details/product_detail_screen.dart';
import 'package:deneme_app/view/profile/profile_screen.dart';
import 'package:deneme_app/view/profile_details_screen/profile_details_screen.dart';
import 'package:deneme_app/view/splash/splash_screen.dart';
import 'package:deneme_app/widgets/nav_bar.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static const String init = '/';
  static const String splashScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String homeScreen = '/home-screen';
  static const String categoryScreen = '/category-screen';
  static const String profileScreen = '/profile-screen';
  static const String productDetail = '/product-detail';
  static const String allProduct = '/allProduct-screen';
  static const String order = '/order-screen';
  static const String signUp = '/signUp-screen';
  static const String addToCart = '/addToCart-screen';
  static const String profileDetails = '/profileDetails-screen';
    static const String privacyPolicy = '/privacyPolicy-screen';

  static List<GetPage> pages = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: homeScreen, page: () => const CustomNavbar()),
    GetPage(name: categoryScreen, page: () => const CategoryScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: productDetail, page: () => const ProductDetailScreen()),
    GetPage(name: allProduct, page: () => const AllProductScreen()),
    GetPage(name: order, page: () => const OrderScreen()),
    GetPage(name: signUp, page: () => const SignUpScreen()),
    GetPage(name: addToCart, page: () => const AddToCartScreen()),
    GetPage(name: profileDetails, page: () => const ProfileDetailsScreen()),
        GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),

  ];
}
