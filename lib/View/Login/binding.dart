import 'package:get/get.dart';
import 'package:weather_app/View/Login/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
