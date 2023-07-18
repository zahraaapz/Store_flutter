import 'package:appstore/controller/homeScreenController.dart';
import 'package:appstore/firstScreen/mainScreen.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/selectType/detail_kala.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:appstore/color/color.dart';

import 'package:flutter/material.dart';

class Select_kala extends StatefulWidget {
  int select;
  final HomeScreenController homeScreenController;
  Select_kala(
      {super.key, required this.select, required this.homeScreenController});

  @override
  State<Select_kala> createState() => _Select_kalaState(
      select: select, homeScreenController: homeScreenController);
}

class _Select_kalaState extends State<Select_kala> {
  String? sel;
  int select;
  final HomeScreenController homeScreenController;

  // List<bool> fav = [];
  // like(int length) {
  //   setState(() {

  //     fav = List.filled(length,true);
  //   });
  // }

  _Select_kalaState({required this.select, required this.homeScreenController});
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

  
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Obx(()=>
         Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                    
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((context) => Home())));
                   
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Rang.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    select == 0
                        ? 'Skincare'
                        : select == 1
                            ? 'Watches'
                            : select == 2
                                ? 'Handbags'
                                : select == 3
                                    ? 'jewellery'
                                    : select == 4
                                        ? 'Eyewear'
                                        : 'Shoes',
                    style: const TextStyle(
                        color: Rang.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(select == 0
                      ? '${homeScreenController.skincare.length} products'
                      : select == 1
                          ? '${homeScreenController.watche.length} products'
                          : select == 2
                              ? '${homeScreenController.bag.length} products'
                              : select == 3
                                  ? '${homeScreenController.jewellery.length} products'
                                  : select == 4
                                      ? '${homeScreenController.eyewear.length} products'
                                      : '${homeScreenController.shoes.length} products'),
                ],
              ),
            ),
             SizedBox(
                    height: 670,
                     child: Obx(()=> GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: select == 0
                              ? homeScreenController.skincare.length
                              : select == 1
                                  ? homeScreenController.watche.length
                                  : select == 2
                                      ? homeScreenController.bag.length
                                      : select == 3
                                          ? homeScreenController
                                              .jewellery.length
                                          : select == 4
                                              ? homeScreenController
                                                  .eyewear.length
                                              : homeScreenController
                                                  .shoes.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8, left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => DetailKala(
                                                    index: index,
                                                    select: select,
                                                    Kalalist: select == 0
                                                        ? homeScreenController
                                                            .skincare
                                                        : select == 1
                                                            ? homeScreenController
                                                                .watche
                                                            : select == 2
                                                                ? homeScreenController
                                                                    .bag
                                                                : select == 3
                                                                    ? homeScreenController
                                                                        .jewellery
                                                                    : select ==
                                                                            4
                                                                        ? homeScreenController
                                                                            .eyewear
                                                                        : homeScreenController
                                                                            .shoes,
                                                  ))));
                                    },
                                    child: Container(
                                      height: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: Image.asset(select == 0
                                                      ? homeScreenController
                                                          .skincare[index].ima!
                                                      : select == 1
                                                          ? homeScreenController
                                                              .watche[index]
                                                              .ima!
                                                          : select == 2
                                                              ? homeScreenController
                                                                  .bag[index]
                                                                  .ima!
                                                              : select == 3
                                                                  ? homeScreenController
                                                                      .jewellery[
                                                                          index]
                                                                      .ima!
                                                                  : select == 4
                                                                      ? homeScreenController
                                                                          .eyewear[
                                                                              index]
                                                                          .ima!
                                                                      : homeScreenController
                                                                          .shoes[
                                                                              index]
                                                                          .ima!)
                                                  .image)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(select == 0
                                          ? homeScreenController.skincare[index].name!
                                          : select == 1
                                              ? homeScreenController.watche[index].name!
                                              : select == 2
                                                  ? homeScreenController.bag[index].name!
                                                  : select == 3
                                                      ? homeScreenController.jewellery[index]
                                                          .name!
                                                      : select == 4
                                                          ? homeScreenController.eyewear[index]
                                                              .name!
                                                          : homeScreenController.shoes[index]
                                                              .name!),
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     like(select == 0
                                      //         ? skincarelist.length
                                      //         : select == 1
                                      //             ? watcheslist.length
                                      //             : select == 2
                                      //                 ? handbaglist.length
                                      //                 : select == 3
                                      //                     ? jewellerylist.length
                                      //                     : select == 4
                                      //                         ? eyewearlist
                                      //                             .length
                                      //                         : shoeslist
                                      //                             .length);
                                      //     setState(() {
                                      //       fav[index] = !fav[index];
                                      //       if (fav[index] == false &&
                                      //           !wishList.contains(select == 0
                                      //               ? skincarelist[index]
                                      //               : select == 1
                                      //                   ? watcheslist[index]
                                      //                   : select == 2
                                      //                       ? handbaglist[index]
                                      //                       : select == 3
                                      //                           ? jewellerylist[
                                      //                               index]
                                      //                           : select == 4
                                      //                               ? eyewearlist[
                                      //                                   index]
                                      //                               : shoeslist[
                                      //                                   index])) {
                                      //         wishList.add(select == 0
                                      //             ? skincarelist[index]
                                      //             : select == 1
                                      //                 ? watcheslist[index]
                                      //                 : select == 2
                                      //                     ? handbaglist[index]
                                      //                     : select == 3
                                      //                         ? jewellerylist[
                                      //                             index]
                                      //                         : select == 4
                                      //                             ? eyewearlist[
                                      //                                 index]
                                      //                             : shoeslist[
                                      //                                 index]);
                                      //       }
                                      //       if (wishList.contains(select == 0
                                      //               ? skincarelist[index]
                                      //               : select == 1
                                      //                   ? watcheslist[index]
                                      //                   : select == 2
                                      //                       ? handbaglist[index]
                                      //                       : select == 3
                                      //                           ? jewellerylist[
                                      //                               index]
                                      //                           : select == 4
                                      //                               ? eyewearlist[
                                      //                                   index]
                                      //                               : shoeslist[
                                      //                                   index]) &&
                                      //           fav[index] == true) {
                                      //         wishList.remove(select == 0
                                      //             ? skincarelist[index]
                                      //             : select == 1
                                      //                 ? watcheslist[index]
                                      //                 : select == 2
                                      //                     ? handbaglist[index]
                                      //                     : select == 3
                                      //                         ? jewellerylist[
                                      //                             index]
                                      //                         : select == 4
                                      //                             ? eyewearlist[
                                      //                                 index]
                                      //                             : shoeslist[
                                      //                                 index]);
                                      //       }
                                      //     });
                                      //   },
                                      //   child: Icon(
                                      //     fav[index] == false
                                      //         ? Icons.favorite
                                      //         : Icons.favorite_border,
                                      //     size: 19,
                                      //     color: Colors.black,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(select == 0
                                          ? homeScreenController.skincare[index].brand!
                                          : select == 1
                                              ? homeScreenController.watche[index].brand!
                                              : select == 2
                                                  ? homeScreenController.bag[index].brand!
                                                  : select == 3
                                                      ? homeScreenController.jewellery[index]
                                                          .brand!
                                                      : select == 4
                                                          ? homeScreenController.eyewear[index]
                                                              .brand!
                                                          : homeScreenController.shoes[index]
                                                              .brand!),
                                      Text(select == 0
                                          ? '${homeScreenController.skincare[index].price}\$'
                                          : select == 1
                                              ? '${homeScreenController.watche[index].price}\$'
                                              : select == 2
                                                  ? '${homeScreenController.bag[index].price}\$'
                                                  : select == 3
                                                      ? '${homeScreenController.jewellery[index].price}\$'
                                                      : select == 4
                                                          ? '${homeScreenController.eyewear[index].price}\$'
                                                          : '${homeScreenController.shoes[index].price}\$'),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          })),
                    ),
                  ),
              //  SpinKitThreeBounce(
              //       color: Rang.blue,
              //     ),
          ]),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.filter),
              InkWell(
                onTap: (() {
                  showModalBottomSheet(
                      //bottomsheetfilter
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: ((context) {
                        return StatefulBuilder(
                          builder: (context, setState) => Container(
                            height: 230,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 25, bottom: 8, top: 8),
                                    child: Text(
                                      'Sort by',
                                      style: TextStyle(
                                          color: Rang.greylight,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Divider(
                                    color: Rang.grey,
                                    indent: 40,
                                    endIndent: 40,
                                    height: 1.5,
                                  ),
                                  RadioListTile(
                                    activeColor: Rang.blue,
                                    title: const Text('Price - Hight to Low'),
                                    groupValue: sel,
                                    value: '0',
                                    onChanged: (value) {
                                      setState(() {
                                        sel = value.toString();
                                      });
                                    },
                                  ),
                                  const Divider(
                                    color: Rang.grey,
                                    indent: 40,
                                    endIndent: 40,
                                    height: 1.5,
                                  ),
                                  RadioListTile(
                                    activeColor: Rang.blue,
                                    title: const Text('Price - Low to Hight'),
                                    groupValue: sel,
                                    value: '1',
                                    onChanged: (value) {
                                      setState(() {
                                        sel = value.toString();
                                      });
                                    },
                                  ),
                                  const Divider(
                                    color: Rang.grey,
                                    indent: 40,
                                    endIndent: 40,
                                    height: 1.5,
                                  ),
                                  RadioListTile(
                                    activeColor: Rang.blue,
                                    title: const Text('Lasted product'),
                                    groupValue: sel,
                                    value: '2',
                                    onChanged: (value) {
                                      setState(() {
                                        sel = value.toString();
                                      });
                                    },
                                  ),
                                ]),
                          ),
                        );
                      }));
                }),
                child: const Icon(Icons.sort_rounded),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
