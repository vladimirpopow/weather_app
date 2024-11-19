import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_app_daily.dart';
import 'package:weather_app/utilites/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherApp> snapshot;
  const CityView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var city = snapshot.data?.city?.name;
    var country = snapshot.data?.city?.country;
    var formatedDate = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
    return Column(
      children: [
        Text(
          '$city, $country',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.black87),
        ),
        Text('${Utill.getFormattedDate(formatedDate)}', style: TextStyle(fontSize: 16),)
      ],
    );
  }
}
