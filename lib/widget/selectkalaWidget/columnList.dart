  
  import 'package:flutter/material.dart';
import '../../../component/dim.dart';
import '../../../component/text_style.dart';
  import 'package:appstore/view/selectType/detail_kala.dart';
  import 'package:appstore/component/extention.dart';
import 'package:get/get.dart';
import 'package:appstore/model/Model.dart';

  Column mainList(RxList<Product> list,selectPage) {
    return Column(
      children: [
        (Dim.small-3).height,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           
             (Dim.xlarge+6).width,
            Text(style: textStyle.bodyMedium, '${list.length} products'),
          ],
        ),
        (Dim.large/2).height,
        SizedBox(
          height: Get.height / 1.28,
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15),
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(DetailKala(
                            index,
                            selectPage,
                            list,
                          ));
                        },
                        child: Container(
                          height: Get.height / 5.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.asset(list[index].ima!).image)),
                        ),
                      ),
                    
                      (Dim.large/2).height,
                      Text(style: textStyle.bodyMedium, list[index].name!),
                    
                      (Dim.large/2).height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(style: textStyle.bodyMedium, list[index].brand!),
                          Text(
                              style: textStyle.bodyMedium,
                              '${list[index].price}\$'),
                        ],
                      ),
                    ],
                  ),
                );
              })),
        ),
      ],
    );
  }