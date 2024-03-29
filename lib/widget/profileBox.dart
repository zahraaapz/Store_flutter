  import 'package:appstore/component/extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/storage.dart';
import '../component/text_style.dart';
import '../constant/color.dart';
import '../constant/dim.dart';

Container profileBox(Image? ima ,Function () _getImage) {
    return Container(
    height:Get.height/6,
    width:Get.width/1.01,
    margin:const EdgeInsets.all(10.0),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Rang.toosi,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              _getImage();
            },
            child: ima != null
                ? 
                Container(
                 
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: ima.image,fit:BoxFit.fill)
                  ),
                )
                
                : const Icon(
                    CupertinoIcons.profile_circled,
                    size: 110,
                    color: Rang.grey,
                  )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              MyStorage.box.read(StorageNames.fullName) ?? '--',
              style: textStyle.bodySmall,
            ),
            (Dim.large / 2).height,
            Text(
              MyStorage.box.read(StorageNames.number) ?? '--',
              style: textStyle.bodySmall,
            ),
            (Dim.large / 2).height,
            Text(
              MyStorage.box.read(StorageNames.email) ?? '--',
              style: textStyle.bodySmall,
            ),
          ],
        ),
        (Dim.xlarge + 6).width,

      ],
    ),
  );
  }