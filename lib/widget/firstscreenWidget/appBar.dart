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
          width: size.width / 4.6,
          height: size.height / 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState?.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Rang.blue,
                  size: 32,
                ),
              ),
              Text(' Home', style: textStyle.displaySmall),
            ],
          ),
        ),
        SizedBox(
          width: size.width / 2.4,
          height: size.height / 20,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Icon(Icons.add_to_photos_rounded, color: Rang.blue),
            InkWell(
                onTap: (() {
                  Get.toNamed(RouteNames.search);
                }),
                child: const Icon(Icons.search, color: Rang.blue)),
            InkWell(
              onTap: () => Get.toNamed(RouteNames.notifition),
              child: const Icon(Icons.notifications_none, color: Rang.blue),
            )
          ]),
        )
      ],
    );
  }