import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';

Future<dynamic> bottomSheetLimitedPrice(
 context,RangeValues  val,List  prices,List   filterPrice,var  homeScreenController,int selectPage,RxInt level) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, setState) => Container(
                height: Get.height / 3.7,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Rang.blue,
                        inactiveTrackColor: Rang.greylight,
                        thumbColor: Rang.blue,
                      ),
                      child: RangeSlider(
                        labels: RangeLabels(
                            val.start.toStringAsFixed(2), val.end.toStringAsFixed(2)),
                        min: prices.first,
                        max: prices.last,
                        divisions: 15,
                        onChanged: (value) {
                          level.value = 0;
                          setState(
                            () {
                              val = value;

                              switch (selectPage) {
                                case 0:
                                  filterPrice.assignAll(homeScreenController
                                      .skincare
                                      .where((element) =>
                                          double.tryParse(
                                                  element.price.toString())! >=
                                              val.start &&
                                          double.tryParse(
                                                  element.price.toString())! <=
                                              val.end));
                                  break;
                                case 1:
                                  filterPrice.assignAll(homeScreenController
                                      .watche
                                      .where((element) =>
                                          double.tryParse(
                                                  element.price.toString())! >=
                                              val.start &&
                                          double.tryParse(
                                                  element.price.toString())! <=
                                              val.end));
                                  break;
                                case 2:
                                  filterPrice.assignAll(homeScreenController.bag
                                      .where((element) =>
                                          double.tryParse(
                                                  element.price.toString())! >=
                                              val.start &&
                                          double.tryParse(
                                                  element.price.toString())! <=
                                              val.end));
                                  break;
                                case 3:
                                  filterPrice.assignAll(homeScreenController
                                      .jewellery
                                      .where((element) =>
                                          double.tryParse(
                                                  element.price.toString())! >=
                                              val.start &&
                                          double.tryParse(
                                                  element.price.toString())! <=
                                              val.end));
                                  break;
                                case 4:
                                  filterPrice.assignAll(homeScreenController
                                      .eyewear
                                      .where((element) =>
                                          double.tryParse(
                                                  element.price.toString())! >=
                                              val.start &&
                                          double.tryParse(
                                                  element.price.toString())! <=
                                              val.end));
                                  break;
                                case 5:
                                  filterPrice.assignAll(homeScreenController
                                      .shoes
                                      .where((element) =>
                                          double.tryParse(
                                                  element.price.toString())! >=
                                              val.start &&
                                          double.tryParse(
                                                  element.price.toString())! <=
                                              val.end));
                                  break;
                              }

                              level.value = 2;
                            },
                          );
                        },
                        values: val,
                      ),
                    ),
                  ],
                ))));
  }