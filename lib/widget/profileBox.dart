import 'dart:io';

import 'package:appstore/component/extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/dim.dart';
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
                        
                          (Dim.large/2).height,
                      Text(
                        MyStorage.box.read(StorageNames.number) ?? '--',
                        style: textStyle.bodySmall,
                      ),  
                        (Dim.large/2).height,
                      Text(
                        MyStorage.box.read(StorageNames.email) ?? '--',
                        style: textStyle.bodySmall,
                      ),
                    ],
                  ),
                 ( Dim.xlarge+6).width,
             
                ],
              ),
            ),
          );
  }