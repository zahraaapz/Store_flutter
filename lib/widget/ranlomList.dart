  import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/text_style.dart';

Padding randomList(select,homeScreenController) {
    return Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SizedBox(
              width: double.infinity,
              height: Get.height / 3.2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: ((context, index) {
                 index=Random().nextInt(5);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: Get.width/1.8,
                        child: Column(children: [
                          Container(
                            height: Get.height / 6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(select == 0
                                        ? homeScreenController
                                            .skincare[index].ima!
                                        : select == 1
                                            ? homeScreenController
                                                .watche[index].ima!
                                            : select == 2
                                                ? homeScreenController
                                                    .bag[index].ima!
                                                : select == 3
                                                    ? homeScreenController
                                                        .jewellery[index].ima!
                                                    : select == 4
                                                        ? homeScreenController
                                                            .eyewear[index]
                                                            .ima!
                                                        : homeScreenController
                                                            .shoes[index]
                                                            .ima!))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      select == 0
                                          ? homeScreenController
                                              .skincare[index].brand!
                                          : select == 1
                                              ? homeScreenController
                                                  .watche[index].brand!
                                              : select == 2
                                                  ? homeScreenController
                                                      .bag[index].brand!
                                                  : select == 3
                                                      ? homeScreenController
                                                          .jewellery[index]
                                                          .brand!
                                                      : select == 4
                                                          ? homeScreenController
                                                              .eyewear[index]
                                                              .brand!
                                                          : homeScreenController
                                                              .shoes[index]
                                                              .brand!,
                                      style: textStyle.bodyMedium,
                                    ),
                                    const Icon(
                                      Icons.favorite_border,
                                      size: 20,
                                    ),
                                  ],
                                ),
                                Text(
                                    select == 0
                                        ? homeScreenController
                                            .skincare[index].name!
                                        : select == 1
                                            ? homeScreenController
                                                .watche[index].name!
                                            : select == 2
                                                ? homeScreenController
                                                    .bag[index].name!
                                                : select == 3
                                                    ? homeScreenController
                                                        .jewellery[index]
                                                        .name!
                                                    : select == 4
                                                        ? homeScreenController
                                                            .eyewear[index]
                                                            .name!
                                                        : homeScreenController
                                                            .shoes[index]
                                                            .name!,
                                    style: textStyle.bodyMedium),
                                Text(
                                    select == 0
                                        ? '${homeScreenController.skincare[index].price!}\$'
                                        : select == 1
                                            ? '${homeScreenController.watche[index].price!}\$'
                                            : select == 2
                                                ? '${homeScreenController.bag[index].price!}\$'
                                                : select == 3
                                                    ? '${homeScreenController.jewellery[index].price!}\$'
                                                    : select == 4
                                                        ? '${homeScreenController.eyewear[index].price!}\$'
                                                        : '${homeScreenController.shoes[index].price!}\$',
                                    strutStyle: const StrutStyle(height: 2),
                                    style: textStyle.bodyMedium),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    );
                  })),
            ),
          );
  }
