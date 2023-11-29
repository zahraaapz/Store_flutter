// ignore_for_file: must_be_immutable
import 'dart:math';
import 'package:appstore/component/extention.dart';
import 'package:appstore/controller/homeScreenController.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/constant/color.dart';
import 'package:appstore/route_manager/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../constant/storage.dart';
import '../../widget/ButtonWidget.dart';
import '../../widget/firstscreenWidget/shoesSize.dart';
import '../../widget/ranlomList.dart';

class DetailKala extends StatefulWidget {
  int index;

  int select;
  List<Product> kalaList;
  DetailKala(this.index, this.select, this.kalaList,
      {super.key, });

  @override
  State<DetailKala> createState() =>
      // ignore: no_logic_in_create_state
      _DetailKalaState(select, index ,kalaList);
}

class _DetailKalaState extends State<DetailKala> {


  _DetailKalaState(this.select, this.index,this.kalalist);

  
  List<Product> kalalist;
  int select;
  int index;
  RxInt sizepa=0.obs;
 late bool isFavorite ;
  @override
  void initState() {
  isFavorite = MyStorage.box.read('${kalalist[index].name}'+ "${kalalist[index].filter}")??false;

    super.initState();
  }
  final int randomValue = Random().nextInt(500000);
   var homeScreenController=Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Rang.blue,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Stack(
                children: [
                  Container(
                    height: Get.height / 2.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: Image.asset(kalalist[index].ima!).image),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 30,
                    child: Container(
                      width: Get.width / 8,
                      height: Get.height / 16,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(110, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(Icons.view_carousel),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kalalist[index].name!,
                    textScaleFactor: 1.9,
                    style: textStyle.headlineMedium,
                  ),
                  Text(
                    kalalist[index].brand!,
                    textScaleFactor: 1.1,
                    style: textStyle.bodyMedium,
                    strutStyle: const StrutStyle(height: 2),
                  ),
                  Row(
                    children: [
                      Text(
                        '${kalalist[index].price}\$',
                        textScaleFactor: 1.6,
                        strutStyle: const StrutStyle(height: 2),
                        style: textStyle.bodyMedium,
                      ),
                      (Dim.large).width,
                      const Text(
                        '20%OFF',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Auliare',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: Get.height / 18,
                            decoration: BoxDecoration(
                                color: Rang.toosi,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '43.5',
                                    style: textStyle.bodyMedium,
                                  ),
                                 (Dim.small-5).width,
                                  const Icon(
                                    CupertinoIcons.star_fill,
                                    color: Rang.orange,
                                    size: 17,
                                  )
                                ],
                              ),
                            )),
                      ),
                 
                      const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Avrange Rating',
                              style: TextStyle(
                                  color: Rang.greylight,
                                  fontFamily: 'Auliare',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('43Rating and 23 Reviews',
                                style: TextStyle(
                                    color: Rang.greylight,
                                    fontFamily: 'Auliare',
                                    fontWeight: FontWeight.bold))
                          ])
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: Get.width / 1.02,
                height: Get.height / 13,
                decoration: BoxDecoration(
                    border: Border.all(color: Rang.blue, width: 2),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: Get.width/2.3,
                        child: Text(
                          'Get upto 30% of on order value above \$100',
                          style: textStyle.bodyMedium,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        width: Get.width / 5,
                        height: Get.height / 18,
                        decoration: BoxDecoration(
                            color: Rang.toosi,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Use code',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Rang.grey,
                                    fontFamily: 'Auliare',
                                    fontWeight: FontWeight.bold)),
                            Text(randomValue.toString(),
                                style: textStyle.bodyMedium),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: select==5,
              child: shoesSize(sizepa))
           ,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: Get.width / 7,
                    height: Get.height / 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Rang.toosi,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                          if (isFavorite == true &&
                              !wishList.contains(kalalist[index])) {
                            wishList.add(kalalist[index]);
                            MyStorage.box.write(
                                '${kalalist[index].name}'+
                                    "${kalalist[index].filter}",
                                isFavorite);
                          }
                          if (isFavorite == false &&
                              wishList.contains(kalalist[index])) {
                            wishList.remove(kalalist[index]);
                            MyStorage.box.remove('${kalalist[index].name}'+
                                "${kalalist[index].filter}");
                          }
                          debugPrint(wishList.length.toString());
                        });
                      },
                      icon: Icon(isFavorite == false
                          ? Icons.favorite_border
                          : Icons.favorite),
                      color: Rang.blue,
                    ),
                  ),
                  ButtonWidget(
                    iconData: Icons.shopping_bag_outlined,
                    title: 'Add to Bags',
                    onPressed: () => _onPressed(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('43 Rating and 23 Reviews', style: textStyle.bodyMedium),
                  InkWell(
                    onTap: (() {
                     Get.toNamed(RouteNames.review);
                    }),
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                      color: Rang.blue,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Text('You might like also', style: textStyle.bodyMedium),
                ],
              ),
            ),
       randomList(select,homeScreenController),
          ],
        ),
      )),
    );
  }

  _onPressed() {
    if (!myBagList.contains(kalalist[index])) {
      setState(() {
        myBagList.add(kalalist[index]);
        debugPrint(myBagList.length.toString());
      });
    }
  }
}
