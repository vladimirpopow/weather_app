import 'package:flutter/material.dart';
import 'package:weather_app/utilites/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Utill.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0];
  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '$tempMin °C',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Image.network(icon, scale: 1.2, color: Colors.white,)
                ],
              )
            ],
          )
        ],
      )
    ],
  );
}
