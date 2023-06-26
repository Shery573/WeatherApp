import 'package:get/get.dart';
import 'package:weather_app/View/Signup/controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
