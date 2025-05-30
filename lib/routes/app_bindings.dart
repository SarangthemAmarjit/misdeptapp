import 'package:get/get.dart';
import '../views/landing/controller/landing_controller.dart';
import '../views/login/controller/login_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LandingController());
    Get.put(LoginController());
  }
}
