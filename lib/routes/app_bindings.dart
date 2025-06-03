import 'package:get/get.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/controller/admin_controller.dart';
import '../views/landing/controller/landing_controller.dart';
import '../views/login/controller/login_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminController());
    Get.put(LandingController());
    Get.put(LoginController());
  }
}
