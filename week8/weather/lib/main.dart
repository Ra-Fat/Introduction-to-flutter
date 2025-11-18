import 'package:flutter/material.dart';
import './weather_card.dart';

List<String> seasonImage = [
  "assets/weather_pic/spring.webp",
  "assets/weather_pic/autumn.webp",
  "assets/weather_pic/summer.jpg",
  "assets/weather_pic/winter.webp",
];

List<String> season = ["SPRING", "AUTUMN", "SUMMER", "WINTER"];

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            padding: EdgeInsets.fromLTRB(15, 12, 15, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "SEASONS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WeatherCard(
                      country: "Franch",
                      seasonImages: seasonImage,
                      season: season,
                      initialSeasonIndex: 0,
                    ),
                    SizedBox(width: 15),
                    WeatherCard(
                      country: "Japan",
                      seasonImages: seasonImage,
                      season: season,
                      initialSeasonIndex: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
