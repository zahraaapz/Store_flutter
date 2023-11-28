import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/text_style.dart';
import '../constant/color.dart';
import '../constant/storage.dart';
import '../controller/pick_file.dart';

Container profileBox({width,height}) {
    return Container(
            height: height ,
            width: width ,
            padding: const EdgeInsets.all(15),
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Rang.toosi,
            ),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: ()  {
                        getFile();
                      },
                      child: Container(
                        height: height ,
                        width: width/4,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: pickFileController.file.value.name ==
                                        'not'
                                    ? const AssetImage(
                                        'assets/image/avatar.png',
                                      )
                                    : Image.file(File(
                                           MyStorage.box.read('ima')))
                                        .image,
                                fit: BoxFit.cover)),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyStorage.box.read(StorageNames.fullName) ??'--',
                        style: textStyle.bodySmall,
                      ),
                        SizedBox(
                  height: 10,
                ),
                      Text(
                        MyStorage.box.read(StorageNames.number) ?? '--',
                        style: textStyle.bodySmall,
                      ),  SizedBox(
                  height: 10,
                ),
                      Text(
                        MyStorage.box.read(StorageNames.email) ?? '--',
                        style: textStyle.bodySmall,
                      ),
                    ],
                  ),
               const SizedBox(width: 30,)
                ],
              ),
            ),
          );
  }