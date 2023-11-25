import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/text_style.dart';

InkWell profileProperty(String title, Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      height: 50,
      width: Get.width / 1.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textStyle.headlineMedium,
          ),
          const Icon(Icons.arrow_forward_ios_outlined)
        ],
      ),
    ),
  );
}