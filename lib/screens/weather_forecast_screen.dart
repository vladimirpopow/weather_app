import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_app_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/city_screen.dart';

import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

import '../widgets/bottom_list_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;

  const WeatherForecastScreen({super.key, this.locationWeather});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherApp> forecastObject;

  String _cityName = 'London';

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = WeatherApi().fetchWeatherForecast();
    }

    // forecastObject.then((weather) {
    //   print(weather.list?[0].weather?[0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Weather',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.my_location,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: [
          IconButton(
              onPressed: () async {
                final tappedName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const CityScreen();
                }));
                if (tappedName != null) {
                  print(tappedName);
                  _cityName = tappedName;
                  setState(() {
                    forecastObject = WeatherApi()
                        .fetchWeatherForecast(cityName: _cityName, isCity: true);
                  });
                }
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder<WeatherApp>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      CityView(snapshot: snapshot),
                      const SizedBox(
                        height: 50,
                      ),
                      TempView(snapshot: snapshot),
                      const SizedBox(
                        height: 50,
                      ),
                      DetailView(snapshot: snapshot),
                      const SizedBox(
                        height: 50,
                      ),
                      BottomListView(snapshot: snapshot)
                    ],
                  );
                } else {
                  return const Center(
                    child: SpinKitDoubleBounce(
                      color: Colors.black,
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
