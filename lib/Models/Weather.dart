import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather {
  RxString location;
  RxInt temperature;
  RxInt humidity;
  void fetchWeatherData() async {
    final response =
        await http.get(Uri.parse('http://localhost:5000/api/weather'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      var data = jsonDecode(response.body);
      print(data);
      int temp = data["temperature"];
      int hum = data["humidity"];
      String loc = data["location"];
      updateHumidity(hum);
      updateTemperature(temp);
      updateLocation(loc);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load weather data');
    }
  }

  void updateLocation(String newLocation) {
    location.value = newLocation;
  }

  void updateHumidity(int newHumidity) {
    humidity.value = newHumidity;
  }

  void updateTemperature(int newTemperature) {
    temperature.value = newTemperature;
  }

  Weather(
      {required this.humidity,
      required this.temperature,
      required this.location});
}
