import 'dart:convert';
import 'package:flutter/material.dart';

//this class defines the structure for all products to be added in the app

class Product {
  final int id;
  final String title, description;
  final String images;
  final List<String> sizes;
  final double rating,price;
  bool isFavourite, isPopular;
  final String catagory;

  Product({
    @required this.id,
    @required this.images,
    @required this.sizes,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
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
      isFavourite: jsonDecode(json['isFav']),
      catagory: json['catagory'],
    );
  }
}

// Our demo Products

// List<Product> demoProducts = [
//   Product(
//     id: 1,
//     images: [
//       "assets/images/ps4_console_white_1.png",
//       "assets/images/ps4_console_white_2.png",
//       "assets/images/ps4_console_white_3.png",
//       "assets/images/ps4_console_white_4.png",
//     ],
//     sizes: ['M', 'L', 'XL', "XXL"],
//     // colors: [
//     //   Color(0xFFF6625E),
//     //   Color(0xFF836DB8),
//     //   Color(0xFFDECB9C),
//     //   Colors.white,
//     // ],
//     title: "Wireless Controller for PS4™",
//     price: 64.99,
//     description: description,
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 2,
//     images: [
//       "assets/images/Image Popular Product 2.png",
//     ],
//     sizes: ['M', 'L', 'XL', "XXL"],
//     // colors: [
//     //   Color(0xFFF6625E),
//     //   Color(0xFF836DB8),
//     //   Color(0xFFDECB9C),
//     //   Colors.white,
//     // ],
//     title: "Nike Sport White - Man Pant",
//     price: 50.5,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Product(
//     id: 3,
//     images: [
//       "assets/images/glap.png",
//     ],
//     sizes: ['M', 'L', 'XL', "XXL"],
//     // colors: [
//     //   Color(0xFFF6625E),
//     //   Color(0xFF836DB8),
//     //   Color(0xFFDECB9C),
//     //   Colors.white,
//     // ],
//     title: "Gloves XC Omega - Polygon",
//     price: 36.55,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 4,
//     images: [
//       "assets/images/wireless headset.png",
//     ],
//     sizes: ['M', 'L', 'XL', "XXL"],
//     // colors: [
//     //   Color(0xFFF6625E),
//     //   Color(0xFF836DB8),
//     //   Color(0xFFDECB9C),
//     //   Colors.white,
//     // ],
//     title: "Logitech Headset",
//     price: 20.20,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//   ),
// ];

// const String description =
//     "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
