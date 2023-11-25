import 'package:flutter/material.dart';

import '../component/text_style.dart';
import '../constant/color.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onPressed,
    this.title,
    this.iconData,
  });

  final String? title;
  final void Function()? onPressed;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStateProperty.all(Rang.blue)),
        onPressed: onPressed,
        child: SizedBox(
          width: 270,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: iconData == null ? false : true,
                  child: Icon(
                    iconData,
                    color: Colors.white,
                  )),
              Text(
                title!,
                style: textStyle.headlineLarge,
              )
            ],
          ),
        ));
  }
}