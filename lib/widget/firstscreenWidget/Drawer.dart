  import 'package:appstore/component/extention.dart';
import 'package:appstore/route_manager/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../model/Model.dart';
import '../../view/selectType/select_kala.dart';
import '../profileBox.dart';

Drawer drawer(size) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          profileBox(
            width: size.width / 1.1,
            height: size.height / 6,
          ),
         
           (Dim.large/2).height,
          Text('Top Categories', style: textStyle.bodyMedium),
          SizedBox(
            height: size.height / 3.3,
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: Model.modelList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: InkWell(
                      child: Text(Model.modelList[index].title,
                          style: textStyle.bodyLarge),
                      onTap: () {
                        Get.to(Selectkala(
                          index,
                        ));
                      },
                    ),
                  );
                })),
          ),
          Text('Contact us', style: textStyle.bodyMedium),
        
          (Dim.medium).height,
          InkWell(
            child: Text('Help & Support', style: textStyle.bodyMedium),
            onTap: () {},
          ),
        
          (Dim.medium).height,
          InkWell(
            child: Text('Wishlist', style: textStyle.bodyMedium),
            onTap: () {
              Get.toNamed(RouteNames.wish);
            },
          ),
        ]),
      ),
    );
  }