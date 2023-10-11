// ignore_for_file: no_logic_in_create_state

import 'package:appstore/model/Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/text_style.dart';
import '../../constant/widget/widget.dart';
import '../../constant/strings/string.dart';

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
   
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
 iconANDtitle('Wishlist', Icons.arrow_back_ios),
      const SizedBox(
        height: 20,
      ),
      wishList.isEmpty?
      Column(children: [
          
          const SizedBox(
            height: 90,
          ),
          Image.asset('assets/image/wish.png'),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: titleEmtypage(MyString.wishEmptytitle),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: contentEmptyPages(MyString.wishEmptyContent)
          ),
          const SizedBox(
            height: 100,
          ),
          const SizedBox(
            height: 50,
            width: 250,
            child: ButtonWidget(
              title:'start shopping'
              ),
          )

      ],)
      :SizedBox(
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
                        Text(wishList[index].brand!,style: textStyle.bodyMedium),
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
                        Text(wishList[index].name!,style: textStyle.bodyMedium),
                        Text("${wishList[index].price}\$",style: textStyle.bodyMedium),
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
