// ignore_for_file: no_logic_in_create_state

import 'package:appstore/color/color.dart';
import 'package:appstore/model/Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wish extends StatefulWidget {



  @override
  State<Wish> createState() =>
      _WishState();
}

class _WishState extends State<Wish> {



  List<Kala> kalaList = [];

  @override
  Widget build(BuildContext context) {
     RxList<RxBool> fav = RxList.generate(wishList.length,((index) => true.obs));
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 8,
          ),
          Text('Wishlist',
              style: TextStyle(
                  color: Rang.blue, fontWeight: FontWeight.bold, fontSize: 23)),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 670,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: wishList.length,
          itemBuilder: ((context, index) {
            return StatefulBuilder(builder: ((context, setState) {
              return Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                              image: Image.asset(wishList[index].ima!).image)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(wishList[index].brand!),
                        GestureDetector(
                          onTap: (() {
                           
                                fav[index].value = !fav[index].value;


                                if (wishList.contains(kalaList[index])&&fav[index].value == false) {
                                  wishList.remove( kalaList[index]);
                                }

                                
                           
                          }),
                          child: Obx(()=>
                           Icon(
                                fav[index] .value== true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(wishList[index].name!),
                        Text("${wishList[index].price}\$"),
                      ],
                    ),
                  ],
                ),
              );
            }));
          }),
        ),
      )
    ])));
  }
}
