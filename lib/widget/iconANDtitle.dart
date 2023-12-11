import 'package:appstore/component/extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/dim.dart';
import '../component/text_style.dart';
import '../constant/color.dart';

Padding iconANDtitle(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(children: [
      IconButton(onPressed: ()=>Get.back(), 
      icon:  Icon(
          icon,
          color: Rang.blue,
          size: 25,
        ),)
  ,
      Dim.large.width,
  
      Text(
        title,
        style: textStyle.displaySmall,
      )
    ]),
  );
}