import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_app_daily.dart';

import 'forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherApp> snapshot;
  const BottomListView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7-day weather forecast'.toUpperCase(),
          style: const TextStyle(
              fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 140,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                color: Colors.black87,
                child: forecastCard(snapshot, index),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 8,
                  ),
              itemCount: snapshot.data!.list!.length),
        )
      ],
    );
  }
}
