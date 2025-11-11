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

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Products",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          color: Colors.blue,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ProductCard(type: Product.dart),
              ProductCard(type: Product.flutter),
              ProductCard(type: Product.firebase),
            ],
          ),
        ),
      ),
    ),
  );
}

class ProductCard extends StatefulWidget {
  final Product type;
  const ProductCard({super.key, required this.type});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.only(bottom: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.type.image, height: 70),
              SizedBox(height: 8),
              Text(
                widget.type.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6),
              Text(widget.type.description),
            ],
          ),
        ),
      ),
    );
  }
}
