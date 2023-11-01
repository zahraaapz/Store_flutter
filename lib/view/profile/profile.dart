


import 'package:appstore/view/profile/personal_info.dart';
import 'package:appstore/view/address/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/text_style.dart';
import '../../constant/widget/widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.white,
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
            child: profileBox(   height: Get.height / 6,
              width: Get.width / 1.01,),
          ),
          profileProperty('Personal Informantion', () => Get.to(Personal())),
          profileProperty('My Address Book', () => Get.to(Address())),
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