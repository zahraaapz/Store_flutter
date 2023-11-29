  import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/text_style.dart';
import '../../constant/color.dart';
import '../../model/Model.dart';

Column shoesSize(select) {
    return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:15.0,top: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      'Select Size',
                                      style: textStyle.bodyMedium,
                                    ),
                                    Text(
                                      ' (Uk Size)',
                                      style: textStyle.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              ////size pa
                              SizedBox(
                                height: 55,
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(left:15.0,),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: sizepa.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            select.value = index;
                                          },
                                          child: Obx(
                                            () => AnimatedContainer(
                                              width: Get.width/8,
                                                      height: Get.height/12,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Rang.blue),
                                                  color: select.value == index
                                                      ? const Color.fromARGB(
                                                          82, 61, 123, 159)
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          45)),
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              child: Center(
                                                child: Text(
                                                    sizepa[index].toString(),
                                                    style:
                                                        textStyle.bodyMedium),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })),
                              ),
                            ],
                          );
  }