import 'package:flutter/material.dart';

class Model {
  String ima;
  String title;
  Model({required this.ima, required this.title});
  static List<Model> modelList = [
    Model(ima: 'assets/p0.png', title: 'Skincare'),
    Model(ima: 'assets/p1.png', title: 'Watches'),
    Model(ima: 'assets/p2.png', title: 'HandBag'),
    Model(ima: 'assets/p3.png', title: 'Jewellery'),
    Model(ima: 'assets/p4.png', title: 'Eyewear'),
    Model(ima: 'assets/p5.png', title: 'Shoes'),
  ];
}

class Kala {
  String ima;
  String name;
  String filter;
  String brand;
  String price;

  Kala(
      {required this.name,
      required this.brand,
      required this.filter,
      required this.price,
      required this.ima});
}

List<Model> cateList = [
  Model(ima: 'assets/personal care.png', title: ''),
  Model(ima: 'assets/wrist watches.png', title: ''),
  Model(ima: 'assets/handbags.png', title: ''),
  Model(ima: 'assets/sunglasses.png', title: ''),
];
List<Model> brands = [
  Model(ima: 'assets/b1.png', title: ''),
  Model(ima: 'assets/b2.png', title: ''),
  Model(ima: 'assets/b3.png', title: ''),
  Model(ima: 'assets/b4.png', title: ''),
  Model(ima: 'assets/b5.png', title: ''),
  Model(ima: 'assets/b6.png', title: ''),
];
List<int> sizepa = [7, 8, 9, 10];

List<IconData> ikon = [
  (Icons.home_outlined),
  (Icons.favorite_border),
  (Icons.person_outline_outlined),
  (Icons.shopping_bag_outlined),
];

List<Kala> wishList = [];
List<String> type = [
  'Skincare',
  'Watches',
  'Handbag',
  'Jewelley',
  'Eyewear',
  'Shoes'
];

class Comment {
  String name, date, time, review;
  int score;

  Comment(
      {required this.name,
      required this.score,
      required this.date,
      required this.time,
      required this.review});
}
