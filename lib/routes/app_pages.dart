import 'package:get/get.dart';
import 'package:misdeptapp/deepseek_dart_20250605_a0cfa8.dart';
import 'package:misdeptapp/page2.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/adminmain.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/controller/admin_controller.dart';
import '../views/landing/home_screen.dart';
import '../views/landing/controller/landing_controller.dart';
import '../views/login/login_screen.dart';
import '../views/login/controller/login_controller.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      // page: () => const HomeScreen(),
      page: () => const DirectorateMISPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LandingController())),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const AdminLoginScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
    ),

    GetPage(
      name: AppRoutes.admindashboard,
      page: () => const AdminMainPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => AdminController())),
    ),
  ];
}
