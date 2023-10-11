// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:appstore/view/profile/personal_info.dart';
import 'package:appstore/view/address/address.dart';
import 'package:appstore/constant/color/color.dart';
import 'package:appstore/controller/pick_file.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/text_style.dart';
import '../../constant/widget/widget.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  PickFileController pickFileController = Get.put(PickFileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Profile', style: textStyle.displaySmall),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: Get.height / 6,
              width: Get.width / 1.01,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Rang.grey,
              ),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(children: [
                      GestureDetector(
                          onTap: () async {
                            getFile();
                          },
                          child: Container(
                            height: Get.height / 7,
                            width: Get.width / 4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: pickFileController.file.value.name ==
                                            'not'
                                        ? const AssetImage(
                                            'assets/image/avatar.png',
                                          )
                                        : Image.file(File(
                                                Personal().box.read('ima')))
                                            .image,
                                    fit: BoxFit.cover)),
                          )),
                      const Positioned(
                          top: 60,
                          left: 5,
                          child: Text(
                            'upload your pic',
                            style: TextStyle(fontSize: 13),
                          )),
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Personal().box.read('fullName') ?? '--',
                          style: textStyle.bodySmall,
                        ),
                        Text(
                          Personal().box.read('number') ?? '--',
                          style: textStyle.bodySmall,
                        ),
                        Text(
                          Personal().box.read('email') ?? '--',
                          style: textStyle.bodySmall,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Rang.greylight,
                    )
                  ],
                ),
              ),
            ),
          ),
          profileProperty('Personal Informantion', () => Get.to(Personal())),
          profileProperty('My Address Book', () => Get.offAll(Address())),
          profileProperty('My Saved Cards', () {}),
          profileProperty('My Order', () {}),
          profileProperty('Refer and Earn', () {}),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ButtonWidgetRevesed(
                title: 'Log Out',
                iconData: Icons.exit_to_app,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
