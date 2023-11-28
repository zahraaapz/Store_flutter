import 'package:flutter/material.dart';

class Model {
  String ima;
  String title;
  Model({required this.ima, required this.title});
  static List<Model> modelList = [
    Model(ima: 'assets/image/type/p0.png', title: 'Skincare'),
    Model(ima: 'assets/image/type/p1.png', title: 'Watches'),
    Model(ima: 'assets/image/type/p2.png', title: 'HandBag'),
    Model(ima: 'assets/image/type/p3.png', title: 'Jewellery'),
    Model(ima: 'assets/image/type/p4.png', title: 'Eyewear'),
    Model(ima: 'assets/image/type/p5.png', title: 'Shoes'),
  ];
}
List<String> addresslist=['Office','Home','Other'];

class Product{
  String? ima;
  String ?name;
  String? filter;
  String? brand;
  String ?price;

  Product(
      {required this.name,
      required this.brand,
      required this.filter,
      required this.price,
      required this.ima});

      Product.fromJson(Map<String,dynamic>element){
        ima=element['ima'];
        name=element['name'];
        filter=element['filter'];
        brand=element['brand'];
        price=element['price'];
      }
}

List<Model> cateList = [
  Model(ima: 'assets/image/personal care.png', title: ''),
  Model(ima: 'assets/image/wrist watches.png', title: ''),
  Model(ima: 'assets/image/handbags.png', title: ''),
  Model(ima: 'assets/image/sunglasses.png', title: ''),
];
List<Model> brands = [
  Model(ima: 'assets/image/brand/b1.png', title: ''),
  Model(ima: 'assets/image/brand/b2.png', title: ''),
  Model(ima: 'assets/image/brand/b3.png', title: ''),
  Model(ima: 'assets/image/brand/b4.png', title: ''),
  Model(ima: 'assets/image/brand/b5.png', title: ''),
  Model(ima: 'assets/image/brand/b6.png', title: ''),
];

List<Model> signup = [
  Model(ima: 'assets/image/s1.png', title: ''),
  Model(ima: 'assets/image/s2.png', title: ''),
  Model(ima: 'assets/image/s3.png', title: ''),
  Model(ima: 'assets/image/s4.png', title: ''),
  Model(ima: 'assets/image/s5.png', title: ''),
  Model(ima: 'assets/image/s6.png', title: ''),
  Model(ima: 'assets/image/s7.png', title: ''),
  Model(ima: 'assets/image/s8.png', title: ''),
  Model(ima: 'assets/image/s9.png', title: ''),
  Model(ima: 'assets/image/s10.png', title: ''),
];



List<int> sizepa = [7, 8, 9, 10];

List<IconData> ikon = [
  (Icons.home_outlined),
  (Icons.favorite_border),
  (Icons.person_outline_outlined),
  (Icons.shopping_bag_outlined),
];

List<Product> wishList = [];
List<Product> myBagList = [];
List<OrderDetail> orderDetail= [
  OrderDetail(title:'Sub Total' ),
  OrderDetail(title:'Discount' ),
  OrderDetail(title: 'Delivery'),
  OrderDetail(title:'Discount Total' ),
];


class OrderDetail{
  String ? title;
 String ? price;
  OrderDetail({this.price,this.title});
  
}
class Comment {
 late String
   name, date, time, review;
 late int score;

  Comment(
      {required this.name,
      required this.score,
      required this.date,
      required this.time,
      required this.review});
      
Comment.fromJson(Map<String,dynamic>element){
name=element['name'];
name=element['score'];
name=element['date'];
name=element['time'];
name=element['review'];

}

}

List expandableCat=['Personal Care','Skincare','Handbags','Apparels','Watches','Eye Wear','Jewellery'];