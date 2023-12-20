// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, unused_label
class WeatherModel {
  String date;
  double temp;
  double max_temp;
  double min_temp;
  String weather_state;
  WeatherModel({
    required this.date,
    required this.temp,
    required this.max_temp,
    required this.min_temp,
    required this.weather_state,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      date: data['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      max_temp: jsonData['maxtemp_c'],
      min_temp: jsonData['mintemp_c'],
      weather_state: jsonData['condition']['text'],
    );
  }

  String getImage() {
    if (weather_state == 'Sunny' ||
        weather_state == 'Clear' ||
        weather_state == 'partly cloudy') {
      return 'assets/images/sun.json';
    } else if (weather_state == 'Blizzard' ||
        weather_state == 'Patchy snow possible' ||
        weather_state == 'Patchy sleet possible' ||
        weather_state == 'Patchy freezing drizzle possible' ||
        weather_state == 'Blowing snow') {
      return 'assets/images/snow.json';
    } else if (weather_state == 'Freezing fog' ||
        weather_state == 'Fog' ||
        weather_state == 'Heavy Cloud' ||
        weather_state == 'Mist' ||
        weather_state == 'Fog') {
      return 'assets/images/cloudy.json';
    } else if (weather_state == 'Patchy rain possible' ||
        weather_state == 'Heavy Rain' ||
        weather_state == 'Showers	') {
      return 'assets/images/rain.json';
    } else if (weather_state == 'Thundery outbreaks possible' ||
        weather_state == 'Moderate or heavy snow with thunder' ||
        weather_state == 'Patchy light snow with thunder' ||
        weather_state == 'Moderate or heavy rain with thunder' ||
        weather_state == 'Patchy light rain with thunder') {
      return 'assets/images/thunder.json';
    } else {
      return 'assets/images/sun.json';
    }
  }
}
