// ignore_for_file: must_be_immutable

import 'package:appstore/view/buy/bag.dart';
import 'package:appstore/view/firstScreen/extractMainScreen.dart';
import 'package:appstore/model/Model.dart';



import 'package:appstore/color/color.dart';
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
        body: Stack(children: [
        
            
               Positioned.fill(
                 child: Obx(()=>
                  IndexedStack(
                      index: selectpg.value,
                      children: [Extractmainscreen(),Wish(), Profile(),  Bag(),]),
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



  Buttonbar({Key? key, required this.changeScreen, required this.selectpg}): super(key: key);
  final Function(int n) changeScreen;
 RxInt  selectpg;


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
              Obx(()=> IconButton(
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
