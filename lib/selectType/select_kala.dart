import 'package:appstore/firstScreen/mainScreen.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/selectType/detail_kala.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'package:appstore/color/color.dart';

import 'package:flutter/material.dart';

class SelectKala extends StatefulWidget {
  int select;

  SelectKala({required this.select});

  @override
  State<SelectKala> createState() => _SelectKalaState(select: select);
}

class _SelectKalaState extends State<SelectKala> {
  String? sel;
  int select;

  List<Kala> skincarelist = [];
  List<Kala> watcheslist = [];
  List<Kala> handbaglist = [];
  List<Kala> jewellerylist = [];
  List<Kala> eyewearlist = [];
  List<Kala> shoeslist = [];
  List fav = [];
  void like(int length) {
    setState(() {
      fav.length = length;
      fav = List.generate(
        length,
        growable: true,
        (index) => true,
      );
    });
  }

  Future getlist(BuildContext context, select) async {
    var url0 = 'http://api.npoint.io/ce2fbbca5a05260adb99';
    var url1 = 'http://api.npoint.io/5b9b109ea434407496a5';
    var url2 = 'http://api.npoint.io/60b30020ebf954e74d5c';
    var url3 = 'http://api.npoint.io/9394e07c75e001f61872';
    var url4 = 'http://api.npoint.io/da1523427aeb4ff86bc1';
    var url5 = 'http://api.npoint.io/d5371a0feeef8aa1b43a';

    var value0 = await http.get(Uri.parse(url0));
    var value1 = await http.get(Uri.parse(url1));
    var value2 = await http.get(Uri.parse(url2));
    var value3 = await http.get(Uri.parse(url3));
    var value4 = await http.get(Uri.parse(url4));
    var value5 = await http.get(Uri.parse(url5));

    if (select == 2) {
      List json = convert.jsonDecode(value2.body);
      if (handbaglist.isEmpty) {
        for (int i = 0; i < json.length; i++) {
          setState(() {
            handbaglist.add(Kala(
                name: json[i]['name'],
                brand: json[i]['brand'],
                filter: json[i]['filter'],
                price: json[i]['price'],
                ima: json[i]['ima']));
          });
        }
      }
      return value2;
    }

    if (select == 1) {
      List json = convert.jsonDecode(value1.body);
      if (watcheslist.isEmpty) {
        for (int i = 0; i < json.length; i++) {
          setState(() {
            watcheslist.add(Kala(
                name: json[i]['name'],
                brand: json[i]['brand'],
                filter: json[i]['filter'],
                price: json[i]['price'],
                ima: json[i]['ima']));
          });
        }
      }
      return value1;
    }

    if (select == 0) {
      List json = convert.jsonDecode(value0.body);
      if (skincarelist.isEmpty) {
        for (int i = 0; i < json.length; i++) {
          setState(() {
            skincarelist.add(Kala(
                name: json[i]['name'],
                brand: json[i]['brand'],
                filter: json[i]['filter'],
                price: json[i]['price'],
                ima: json[i]['ima']));
          });
        }
      }
      return value0;
    }

    if (select == 3) {
      List json = convert.jsonDecode(value3.body);
      if (jewellerylist.isEmpty) {
        for (int i = 0; i < json.length; i++) {
          setState(() {
            jewellerylist.add(Kala(
                name: json[i]['name'],
                brand: json[i]['brand'],
                filter: json[i]['filter'],
                price: json[i]['price'],
                ima: json[i]['ima']));
          });
        }
      }
      return value3;
    }
    if (select == 4) {
      List json = convert.jsonDecode(value4.body);
      if (eyewearlist.isEmpty) {
        for (int i = 0; i < json.length; i++) {
          setState(() {
            eyewearlist.add(Kala(
                name: json[i]['name'],
                brand: json[i]['brand'],
                filter: json[i]['filter'],
                price: json[i]['price'],
                ima: json[i]['ima']));
          });
        }
      }
      return value4;
    }

    if (select == 5) {
      List json = convert.jsonDecode(value5.body);
      if (shoeslist.isEmpty) {
        for (int i = 0; i < json.length; i++) {
          setState(() {
            shoeslist.add(Kala(
                name: json[i]['name'],
                brand: json[i]['brand'],
                filter: json[i]['filter'],
                price: json[i]['price'],
                ima: json[i]['ima']));
          });
        }
      }
      return value5;
    }
  }

  _SelectKalaState({required this.select});
  @override
  void initState() {
    super.initState();
    getlist(context, select);
    like(select);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
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
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const Home())));
                    });
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
                    ? '${skincarelist.length} products'
                    : select == 1
                        ? '${watcheslist.length} products'
                        : select == 2
                            ? '${handbaglist.length} products'
                            : select == 3
                                ? '${jewellerylist.length} products'
                                : select == 4
                                    ? '${eyewearlist.length} products'
                                    : '${shoeslist.length} products'),
              ],
            ),
          ),
          FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return snapshot.hasData
                  ? SizedBox(
                      height: 670,
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: select == 0
                              ? skincarelist.length
                              : select == 1
                                  ? watcheslist.length
                                  : select == 2
                                      ? handbaglist.length
                                      : select == 3
                                          ? jewellerylist.length
                                          : select == 4
                                              ? eyewearlist.length
                                              : shoeslist.length,
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
                                                        ? skincarelist
                                                        : select == 1
                                                            ? watcheslist
                                                            : select == 2
                                                                ? handbaglist
                                                                : select == 3
                                                                    ? jewellerylist
                                                                    : select ==
                                                                            4
                                                                        ? eyewearlist
                                                                        : shoeslist,
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
                                                      ? skincarelist[index].ima
                                                      : select == 1
                                                          ? watcheslist[index]
                                                              .ima
                                                          : select == 2
                                                              ? handbaglist[
                                                                      index]
                                                                  .ima
                                                              : select == 3
                                                                  ? jewellerylist[
                                                                          index]
                                                                      .ima
                                                                  : select == 4
                                                                      ? eyewearlist[
                                                                              index]
                                                                          .ima
                                                                      : shoeslist[
                                                                              index]
                                                                          .ima)
                                                  .image)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(select == 0
                                          ? skincarelist[index].name
                                          : select == 1
                                              ? watcheslist[index].name
                                              : select == 2
                                                  ? handbaglist[index].name
                                                  : select == 3
                                                      ? jewellerylist[index]
                                                          .name
                                                      : select == 4
                                                          ? eyewearlist[index]
                                                              .name
                                                          : shoeslist[index]
                                                              .name),
                                      GestureDetector(
                                        onTap: () {
                                          like(select == 0
                                              ? skincarelist.length
                                              : select == 1
                                                  ? watcheslist.length
                                                  : select == 2
                                                      ? handbaglist.length
                                                      : select == 3
                                                          ? jewellerylist.length
                                                          : select == 4
                                                              ? eyewearlist
                                                                  .length
                                                              : shoeslist
                                                                  .length);
                                          setState(() {
                                            fav[index] = !fav[index];
                                            if (fav[index] == false &&
                                                !wishList.contains(select == 0
                                                    ? skincarelist[index]
                                                    : select == 1
                                                        ? watcheslist[index]
                                                        : select == 2
                                                            ? handbaglist[index]
                                                            : select == 3
                                                                ? jewellerylist[
                                                                    index]
                                                                : select == 4
                                                                    ? eyewearlist[
                                                                        index]
                                                                    : shoeslist[
                                                                        index])) {
                                              wishList.add(select == 0
                                                  ? skincarelist[index]
                                                  : select == 1
                                                      ? watcheslist[index]
                                                      : select == 2
                                                          ? handbaglist[index]
                                                          : select == 3
                                                              ? jewellerylist[
                                                                  index]
                                                              : select == 4
                                                                  ? eyewearlist[
                                                                      index]
                                                                  : shoeslist[
                                                                      index]);
                                            }
                                            if (wishList.contains(select == 0
                                                    ? skincarelist[index]
                                                    : select == 1
                                                        ? watcheslist[index]
                                                        : select == 2
                                                            ? handbaglist[index]
                                                            : select == 3
                                                                ? jewellerylist[
                                                                    index]
                                                                : select == 4
                                                                    ? eyewearlist[
                                                                        index]
                                                                    : shoeslist[
                                                                        index]) &&
                                                fav[index] == true) {
                                              wishList.remove(select == 0
                                                  ? skincarelist[index]
                                                  : select == 1
                                                      ? watcheslist[index]
                                                      : select == 2
                                                          ? handbaglist[index]
                                                          : select == 3
                                                              ? jewellerylist[
                                                                  index]
                                                              : select == 4
                                                                  ? eyewearlist[
                                                                      index]
                                                                  : shoeslist[
                                                                      index]);
                                            }
                                          });
                                        },
                                        child: Icon(
                                          fav[index] == false
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          size: 19,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(select == 0
                                          ? skincarelist[index].brand
                                          : select == 1
                                              ? watcheslist[index].brand
                                              : select == 2
                                                  ? handbaglist[index].brand
                                                  : select == 3
                                                      ? jewellerylist[index]
                                                          .brand
                                                      : select == 4
                                                          ? eyewearlist[index]
                                                              .brand
                                                          : shoeslist[index]
                                                              .brand),
                                      Text(select == 0
                                          ? '${skincarelist[index].price}\$'
                                          : select == 1
                                              ? '${watcheslist[index].price}\$'
                                              : select == 2
                                                  ? '${handbaglist[index].price}\$'
                                                  : select == 3
                                                      ? '${jewellerylist[index].price}\$'
                                                      : select == 4
                                                          ? '${eyewearlist[index].price}\$'
                                                          : '${shoeslist[index].price}\$'),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          })),
                    )
                  : const SpinKitThreeBounce(
                      color: Rang.blue,
                    );
            },
            future: getlist(context, select),
          ),
        ]),
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
