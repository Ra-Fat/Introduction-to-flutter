import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

class ImageViewerPage extends StatefulWidget {
  const ImageViewerPage({super.key});

  @override
  State<ImageViewerPage> createState() => _ImageViewerPageState();
}

class _ImageViewerPageState extends State<ImageViewerPage> {

  int currentIndex = 0;

  void showNextImage(){
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  void showPrevImage(){
    setState(() {
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: showPrevImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: showNextImage,
            ),
          ),
        ],
      ),
      body: ImageCard(imagePath: images[currentIndex]),
    );
  }
}


class ImageCard extends StatelessWidget {
  final String imagePath;
  const ImageCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.contain,
    );
  }
}