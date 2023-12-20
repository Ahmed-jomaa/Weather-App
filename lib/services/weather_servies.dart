import 'dart:convert';

import 'package:http/http.dart' as http;
import '/models/weather_model.dart';

class WeatherService {
  String baseURl = 'http://api.weatherapi.com/v1';
  String apiKey = 'a2ac052ee0834887936130540231106';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse(
        '$baseURl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
