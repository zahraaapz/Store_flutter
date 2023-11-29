
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/text_style.dart';
import '../constant/color.dart';

class ButtonWidgetRevesed extends StatelessWidget {
  const ButtonWidgetRevesed(
      {super.key, this.title, this.onPressed, this.iconData});
  final String? title;
  final Function()? onPressed;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: Get.width/1.8,
        height: Get.height/14,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              side: MaterialStateProperty.all(
                  const BorderSide(color: Rang.blue, width: 1.5)),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Rang.blue;
                }
                return Colors.white;
              })),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: iconData == null ? false : true,
                  child: Icon(
                    iconData,
                    color: Rang.blue,
                  )),
              Text(
                title!,
                style: textStyle.displaySmall,
              ),
            ],
          )),
    );
  }
}