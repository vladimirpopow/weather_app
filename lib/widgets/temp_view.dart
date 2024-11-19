import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_app_daily.dart';

class TempView extends StatelessWidget {
  TempView({super.key, required this.snapshot});
  final AsyncSnapshot<WeatherApp> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList[0].temp?.day?.toStringAsFixed(0);
    var discription = forecastList[0].weather![0].description?.toUpperCase();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            icon,
            scale: 0.5,
            color: Colors.black87,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                '$temp °C',
                style: TextStyle(fontSize: 54, color: Colors.black87),
              ),
              Text(
                '$discription',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
