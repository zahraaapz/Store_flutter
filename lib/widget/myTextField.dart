import 'package:flutter/material.dart';

import '../constant/color.dart';

Container myTextField(
    {Size? size,
    double? width,
    String? hintText,
    TextEditingController? controller,
    TextInputType? textInputType,
    Color color = Rang.toosi}) {
  return Container(
    //  padding: EdgeInsets.fromLTRB(left, top, right, bottom),
    height: size!.height / 15,
    width: width,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
    child: TextField(

keyboardType: textInputType ,   
      controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          helperStyle: const TextStyle(color: Rang.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15))
              ),
    ),
  );
}