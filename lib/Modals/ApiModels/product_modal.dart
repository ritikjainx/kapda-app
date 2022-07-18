import 'dart:convert';
import 'package:flutter/material.dart';

/// This class defines the structure for all products to be added in the app

class Product {

  final int id;
  final String title, description;
  final String images;
  final List<String> sizes;
  final double rating,price;
  final String catagory;

  Product({
    @required this.id,
    @required this.images,
    @required this.sizes,
    this.rating = 0.0,
    @required this.title,
    @required this.price,
    @required this.description,
    this.catagory,
  });

    @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory Product.fromJson(Map<String, dynamic> json) {
    List sizes = List<String>.from(jsonDecode(json['sizes']));

    return Product(
      id: jsonDecode(json['id']),
      images: json['image'],
      sizes: sizes,
      title: json['title'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      rating: double.parse(json['rating'].toString()),
      catagory: json['catagory'],
    );
  }
}