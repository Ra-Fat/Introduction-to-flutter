import 'package:flutter/material.dart';
import 'weather_card.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather App",
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {},
                child: Image.asset("assets/ex4/hamBar.jpg", height: 30),
              ),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: const [
            WeatherCard(
              city: "Phnom Penh",
              currentTemperature: 12.2,
              minTemperature: 10,
              maxTemperature: 30,
              image: Image(image: AssetImage("assets/ex4/cloudy.png")),
              backgroundColor: [
                Colors.purple,
                Color.fromARGB(255, 228, 123, 246),
              ],
            ),
            WeatherCard(
              city: "Paris",
              currentTemperature: 22.2,
              minTemperature: 10,
              maxTemperature: 40,
              image: Image(image: AssetImage("assets/ex4/sunnyCloudy.png")),
              backgroundColor: [
                Color.fromARGB(255, 26, 215, 168),
                Color.fromARGB(255, 39, 198, 169),
              ],
            ),
            WeatherCard(
              city: "Rome",
              currentTemperature: 45.3,
              minTemperature: 10,
              maxTemperature: 30,
              image: Image(image: AssetImage("assets/ex4/sunny.png")),
              backgroundColor: [
                Colors.pink,
                Color.fromARGB(255, 251, 157, 188),
              ],
            ),
            WeatherCard(
              city: "Toulouse",
              currentTemperature: 45.2,
              minTemperature: 13,
              maxTemperature: 30,
              image: Image(image: AssetImage("assets/ex4/veryCloudy.png")),
              backgroundColor: [
                Colors.orange,
                Color.fromARGB(255, 233, 183, 106),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
