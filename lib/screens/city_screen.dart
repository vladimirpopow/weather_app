import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            cursorColor: Colors.blueGrey,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                icon: Icon(Icons.location_city_sharp),
                hintText: 'Введите название города ',
                filled: true,
                fillColor: Colors.black87,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(color: Colors.white)),
          ),
        ),
        OutlinedButton(
            child: const Text('Узнать погоду'),
            onPressed: () {
              Navigator.pop(context, cityName);
            })
      ]),
    );
  }
}
