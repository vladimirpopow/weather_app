import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_app_daily.dart';
import 'package:weather_app/utilites/constants.dart';
import 'package:weather_app/utilites/location.dart';

class WeatherApi {
  Future<WeatherApp> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String?> parameters;

    if (isCity == true) {
      var queryParameters = {
        'q': cityName,
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
      };
      parameters = queryParameters;
    } else {
       var queryParameters = {
        'lat': location.latitude.toString(),
        'lon': location.longtitude.toString(),
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
      };
      parameters = queryParameters;
    }

    final uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);

    log('request: ${uri.toString()}');

    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode.toString());
      return WeatherApp.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.statusCode.toString());
    }
  }
}
