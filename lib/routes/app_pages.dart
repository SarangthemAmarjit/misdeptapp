import 'package:get/get.dart';
import '../views/landing/home_screen.dart';
import '../views/landing/controller/landing_controller.dart';
import '../views/login/login_screen.dart';
import '../views/login/controller/login_controller.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LandingController())),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const AdminLoginScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
    ),
  ];
}
