import 'package:flutter/material.dart';
import './product_card.dart';

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
