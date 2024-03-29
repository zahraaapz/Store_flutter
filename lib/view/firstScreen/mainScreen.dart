// ignore_for_file: must_be_immutable

import 'package:appstore/view/Basket/basket.dart';
import 'package:appstore/view/FirstScreen/extractMainScreen.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/constant/color.dart';
import 'package:appstore/view/profile/profile.dart';
import 'package:appstore/view/wish/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  RxInt selectpg = 0.obs;

  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Stack(children: [
          Positioned.fill(
            bottom: 0,
            right: 0,
            left: 0,
            child: Obx(
              () => IndexedStack(index: selectpg.value, children:  [
                Extractmainscreen(),
                Wish(),
                Profile(),
                Basket(),
              ]),
            ),
          ),
          Buttonbar(
              selectpg: selectpg,
              changeScreen: (int newpg) {
                selectpg.value = newpg;
              }),
        ]),
      ),
    );
  }
}

class Buttonbar extends StatelessWidget {
  Buttonbar({Key? key, required this.changeScreen, required this.selectpg})
      : super(key: key);
  final Function(int n) changeScreen;
  RxInt selectpg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < ikon.length; i++)
              Obx(
                () => IconButton(
                    onPressed: (() {
                      changeScreen(i);
                    }),
                    icon: Icon(
                      ikon[i],
                      color: selectpg.value == i ? Rang.blue : Rang.greylight,
                      size: selectpg.value == i ? 27 : 23,
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
