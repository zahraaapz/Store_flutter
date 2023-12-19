  import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/text_style.dart';
import '../../constant/color.dart';
import '../../route_manager/route_name.dart';

Row appBar(Size size, BuildContext context,GlobalKey<ScaffoldState>  _key) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width /3.8,
          height: size.height /20,
         
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    _key.currentState?.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Rang.blue,
                  size: 30,
                  ),
                ),
                Text(' Home', style: textStyle.displaySmall,),
              ],
            ),
          ),
        ),
        SizedBox(
          width: size.width / 2.4,
          height: size.height / 20,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
         IconButton(onPressed: () {
           
         },icon:const Icon(Icons.add_to_photos_rounded), color: Rang.blue),
            IconButton(
                onPressed: (() {
                  Get.toNamed(RouteNames.search);
                }),
                icon: const Icon(Icons.search, color: Rang.blue)),
            IconButton(
              onPressed: () => Get.toNamed(RouteNames.notifition),
              icon: const Icon(Icons.notifications_none, color: Rang.blue),
            )
          ]),
        )
      ],
    );
  }