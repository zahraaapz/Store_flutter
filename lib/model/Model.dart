import 'package:flutter/material.dart';

class Model {
  String ima;
  String title;
  Model({required this.ima, required this.title});
  static List<Model> modelList = [
    Model(ima: 'assets/type/p0.png', title: 'Skincare'),
    Model(ima: 'assets/type/p1.png', title: 'Watches'),
    Model(ima: 'assets/type/p2.png', title: 'HandBag'),
    Model(ima: 'assets/type/p3.png', title: 'Jewellery'),
    Model(ima: 'assets/type/p4.png', title: 'Eyewear'),
    Model(ima: 'assets/type/p5.png', title: 'Shoes'),
  ];
}
List<String> addresslist=['Office','Home','Other'];

class Kala {
  String? ima;
  String ?name;
  String? filter;
  String? brand;
  String ?price;

  Kala(
      {required this.name,
      required this.brand,
      required this.filter,
      required this.price,
      required this.ima});

      Kala.fromJson(Map<String,dynamic>element){
        ima=element['ima'];
        name=element['name'];
        filter=element['filter'];
        brand=element['brand'];
        price=element['price'];
      }
}

List<Model> cateList = [
  Model(ima: 'assets/personal care.png', title: ''),
  Model(ima: 'assets/wrist watches.png', title: ''),
  Model(ima: 'assets/handbags.png', title: ''),
  Model(ima: 'assets/sunglasses.png', title: ''),
];
List<Model> brands = [
  Model(ima: 'assets/brand/b1.png', title: ''),
  Model(ima: 'assets/brand/b2.png', title: ''),
  Model(ima: 'assets/brand/b3.png', title: ''),
  Model(ima: 'assets/brand/b4.png', title: ''),
  Model(ima: 'assets/brand/b5.png', title: ''),
  Model(ima: 'assets/brand/b6.png', title: ''),
];
List<int> sizepa = [7, 8, 9, 10];

List<IconData> ikon = [
  (Icons.home_outlined),
  (Icons.favorite_border),
  (Icons.person_outline_outlined),
  (Icons.shopping_bag_outlined),
];

List<Kala> wishList = [];
List<Kala> myBagList = [];
List<OrderDetail> orderDetail= [
  OrderDetail(title:'Sub Total' ),
  OrderDetail(title:'Discount' ),
  OrderDetail(title: 'Delivery'),
  OrderDetail(title:'Grand Total' ),
];


class OrderDetail{
  String ? title;
 String ? price;
  OrderDetail({this.price,this.title});
  
}
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

