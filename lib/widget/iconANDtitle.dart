import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/text_style.dart';
import '../constant/color.dart';

Padding iconANDtitle(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(children: [
      InkWell(
        onTap: () => Get.back(),
        child: Icon(
          icon,
          color: Rang.blue,
          size: 25,
        ),
      ),
      const SizedBox(width: 20),
      Text(
        title,
        style: textStyle.displaySmall,
      )
    ]),
  );
}