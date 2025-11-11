import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String city;
  final double currentTemperature;
  final double minTemperature;
  final double maxTemperature;
  final Image image;
  final List<Color> backgroundColor;

  const WeatherCard({
    required this.city,
    required this.currentTemperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.image,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: const EdgeInsets.only(left: 15),
          height: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: backgroundColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: ClipOval(child: image),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      city,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Min $minTemperature °C",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      "Max $maxTemperature °C",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: double.infinity,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(60),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                  ),
                  Text(
                    "$currentTemperature °C",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
