import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color/color.dart';
import '../text_style.dart';

Text contentEmptyPages(String title) {
  return Text(
    title,
    textAlign: TextAlign.center,
    style: textStyle.bodyMedium,
    strutStyle: const StrutStyle(height: 2),
  );
}

Text titleEmtypage(String title) {
  return Text(
    title,
    style: textStyle.headlineSmall,
  );
}

massage(String title, context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Color.fromARGB(204, 27, 75, 102),
      content: SizedBox(
        height: 60,
        child: Center(
          child: Text(
            'Enter information',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Auliare'),
          ),
        ),
      )));
}

Padding iconANDtitle(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(children: [
      GestureDetector(
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

GestureDetector profileProperty(String title, Function() onTap) {
  return GestureDetector(
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

class ButtonWidgetRevesed extends StatelessWidget {
  const ButtonWidgetRevesed(
      {super.key, this.title, this.onPressed, this.iconData});
  final String? title;
  final Function()? onPressed;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 60,
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

Container myTextField(
    {Size? size,
    double? width,
    String? hintText,
    var controller,
    Color color = Rang.toosi}) {
  return Container(
    //  padding: EdgeInsets.fromLTRB(left, top, right, bottom),
    height: size!.height / 15,
    width: width,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          helperStyle: const TextStyle(color: Rang.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15))),
    ),
  );
}
