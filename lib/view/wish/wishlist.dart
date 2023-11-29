// ignore_for_file: no_logic_in_create_state

import 'package:appstore/component/extention.dart';
import 'package:appstore/model/Model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../constant/storage.dart';

import '../../constant/string.dart';
import '../../route_manager/route_name.dart';
import '../../widget/ButtonWidget.dart';
import '../../widget/contentEmptyPages.dart';
import '../../widget/iconANDtitle.dart';
import '../../widget/titleEmtypage.dart';


class Wish extends StatefulWidget {
  const Wish({super.key});

  @override
  State<Wish> createState() => _WishState();
}

class _WishState extends State<Wish> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      iconANDtitle('Wishlist', Icons.arrow_back_ios),
      (Dim.large).height,
      wishList.isEmpty
          ? Column(
              children: [
                 (Dim.large*5).height,
                Image.asset('assets/image/wish.png'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: titleEmtypage(MyString.wishEmptytitle),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: contentEmptyPages(MyString.wishEmptyContent)),
                (Dim.large*5).height,
                 ButtonWidget(
                  onPressed: () => Get.offAllNamed(RouteNames.home),
                  title: 'start shopping')
              ],
            )
          : myWishList()
    ])));
  }

  SizedBox myWishList() {
    return SizedBox(
      height: Get.height / 1.2,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: wishList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Get.height / 5,
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
                    Text(wishList[index].brand!, style: textStyle.bodyMedium),
                    InkWell(
                      onTap: (() {
                           MyStorage.box.remove
                          ('${wishList[index].name}'+
                              "${wishList[index].filter}");
                        setState(() {
                          wishList.remove(wishList[index]);

                       

                        });
                      }),
                      child: const Icon(Icons.close, size: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(wishList[index].name!, style: textStyle.bodyMedium),
                    Text("${wishList[index].price}\$",
                        style: textStyle.bodyMedium),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
