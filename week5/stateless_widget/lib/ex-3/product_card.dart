import 'package:flutter/material.dart';

enum Product {
  dart(
    title: "Dart",
    description: "The best object-oriented language",
    image: "assets/ex3/dart.png",
  ),
  flutter(
    title: "Flutter",
    description: "The best mobile widget library",
    image: "assets/ex3/flutter.png",
  ),
  firebase(
    title: "Firebase",
    description: "The best cloud database",
    image: "assets/ex3/firebase.png",
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

class ProductCard extends StatelessWidget {
  final Product type;
  const ProductCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.only(bottom: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(type.image, height: 70),
              const SizedBox(height: 8),
              Text(
                type.title,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Text(type.description),
            ],
          ),
        ),
      ),
    );
  }
}
