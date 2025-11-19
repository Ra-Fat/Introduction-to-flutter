import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget {
  final String subject;
  const ScoreCard({super.key, required this.subject});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late String _subject;

  @override
  void initState() {
    super.initState();
    _subject = widget.subject;
  }

  double progress = 00;

  void _incrementProgress() {
    setState(() {
      progress += 0.25;
      if (progress > 1.0) progress = 1.0;
    });
  }

  void _decrementProgress() {
    setState(() {
      progress -= 0.25;
      if (progress < 0.0) progress = 0.0;
    });
  }

  Color _progressColor() {
    if (progress == 0.0) return Colors.grey.shade200;
    if (progress <= 0.25) return const Color.fromARGB(255, 129, 241, 133);
    if (progress <= 0.5) return const Color.fromARGB(255, 67, 173, 71);
    if (progress <= 0.75) return const Color.fromARGB(255, 23, 120, 26);
    return const Color.fromARGB(255, 4, 57, 6);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "My Score $_subject",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: Icon(Icons.add), onPressed: _incrementProgress),
              SizedBox(width: 30),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: _decrementProgress,
              ),
            ],
          ),
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1),
            ),
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    decoration: BoxDecoration(
                      color: _progressColor(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
