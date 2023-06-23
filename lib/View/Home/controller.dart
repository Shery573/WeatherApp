import 'package:get/get.dart';
import 'package:weather_app/Models/Weather.dart';

class HomeController extends GetxController {
  Weather islamabad =
      Weather(humidity: 0.obs, temperature: 0.obs, location: "".obs);
  @override
  void onInit() {
    islamabad.fetchWeatherData();
    super.onInit();
  }

  // void fetchWeatherData() async {
  //   final response =
  //       await http.get(Uri.parse('http://localhost:5000/api/weather'));

  //   if (response.statusCode == 200) {
  //     // If the server returns a 200 OK response, parse the JSON.
  //     var data = jsonDecode(response.body);
  //     print(data);
  //   } else {
  //     // If the server did not return a 200 OK response, throw an exception.
  //     throw Exception('Failed to load weather data');
  //   }
  // }
}
