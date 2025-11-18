import 'package:flutter/material.dart';

class WeatherCard extends StatefulWidget {
  
  final List<String> seasonImages;
  final String country;
  final List<String> season;
  final int initialSeasonIndex;

  const WeatherCard({
    super.key,
    required this.country,
    required this.seasonImages,
    required this.season,
    this.initialSeasonIndex = 0,
  });

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialSeasonIndex;
  }

  void _toggleImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.seasonImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String currentSeason = widget.season[currentIndex];

    return GestureDetector(
      onTap: _toggleImage,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Column(
          children: [
            Image.asset(
              widget.seasonImages[currentIndex],
              width: 135,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    currentSeason,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    widget.country,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
