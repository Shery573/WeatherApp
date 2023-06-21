import 'package:get/get.dart';
import 'package:weather_app/View/Home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
