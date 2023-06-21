class Weather {
  String location;
  double temperature;
  double humidity;
  void updateLocation(String newLocation) {
    location = newLocation;
  }

  void updateHumidity(double newHumidity) {
    humidity = newHumidity;
  }

  void updateTemperature(double newTemperature) {
    temperature = newTemperature;
  }

  Weather(
      {required this.humidity,
      required this.temperature,
      required this.location});
}
