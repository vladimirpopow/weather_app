import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/models/weather_app_daily.dart';
import 'package:weather_app/utilites/forecast_util.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.snapshot});
  final AsyncSnapshot<WeatherApp> snapshot;
  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var pressure = forecastList![0].pressure! * 0.750062;
    var humidity = forecastList[0].humidity! * 0.750062;
    var wind = forecastList[0].speed! * 0.750062;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          
          Utill().getItem(FontAwesomeIcons.temperatureThreeQuarters,
              pressure.round(), 'mm Hg'),
              Utill().getItem(FontAwesomeIcons.cloudRain, humidity.round(), '%'),
              Utill().getItem(FontAwesomeIcons.wind, wind.toInt(), 'm/s')
        ],
      ),
    );
  }
}
