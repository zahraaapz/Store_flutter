

import 'package:flutter/material.dart';

import '../constant/color.dart';

Container myTextField(
    {Size? size,
    double? width,
    double? height,
    int? maxLength,
    String? hintText,
    bool border=true,
    context,
    TextEditingController? controller,
    TextInputType? textInputType,
    Color color = Rang.toosi}) {
  return Container(
    decoration:BoxDecoration
    ( borderRadius: BorderRadius.circular(15), color:height==null?null: Rang.toosi),
    height:  height ?? size!.height / 15,
    width: width,
    child: TextField(
      //scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      textAlignVertical: TextAlignVertical.bottom,
      maxLength: maxLength,
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
          hintText: hintText,
          fillColor:  Rang.toosi,
          helperStyle: const TextStyle(color: Rang.grey),
          border: OutlineInputBorder(
            
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
          focusedBorder:border?
           OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(15)):null),
    ),
  );
}
