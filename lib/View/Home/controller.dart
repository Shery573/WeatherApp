import 'package:get/get.dart';
import 'package:weather_app/Models/Weather.dart';

class HomeController extends GetxController {
  Weather islamabad = Weather(humidity: 0, temperature: 0, location: "");
  @override
  void onInit() {
    islamabad.updateHumidity(50);
    islamabad.updateLocation("F7, Islamabad, Pakistan");
    islamabad.updateTemperature(38);
    super.onInit();
  }
}
