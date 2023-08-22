// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:appstore/view/profile/personal_info.dart';
import 'package:appstore/address.dart';
import 'package:appstore/color/color.dart';
import 'package:appstore/controller/pick_file.dart';
import 'package:appstore/view/search/search.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/component.dart';

class Profile extends StatelessWidget {
   Profile({super.key});

PickFileController pickFileController=Get.put(PickFileController());
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
                Text('Profile',
                    style: textStyle.displaySmall),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 130,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Rang.grey,
              ),
              child: Obx(()=>
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Stack(
                       children:[ GestureDetector(
                        onTap: () async{
                         getFile(); 
                    
                        },
                         child:pickFileController.file.value.name=='not'?
                            Container(
                                          height: 100,
                                         width: 100,
                                          decoration: const BoxDecoration(
                                         
                                            shape: BoxShape.circle,
                                           image: DecorationImage(image: AssetImage('assets/image/avatar.png',),fit:BoxFit.cover )
                                          ),
                                          )
                         
                                   
                       
                       : Container(
                                          height: 100,
                                         width: 100,
                                          decoration: BoxDecoration(
                                     shape: BoxShape.circle,
                                           image: DecorationImage(

                                            image:Image.file(
                                             File(pickFileController.file.value.path!)).image ,fit:BoxFit.cover,)
                                          ),
                       )),
                       const Positioned(
                        top: 60,
                        left: 5,
                        child: Text('upload your pic',style: TextStyle(fontSize: 13),)),
                  ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(Personal().box.read('fullName') ?? '--',style: textStyle.headlineMedium,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(Personal().box.read('number')??'--',style: textStyle.headlineMedium,),
                        ),
                        Text(
                         Personal().box.read('email')??'--',
style: textStyle.headlineMedium,                        ),
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
           Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => Get.to(Personal()),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal Informantion',
                    style: textStyle.headlineMedium,
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => Get.offAll(Address()),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Address Book',
                      style: textStyle.headlineMedium,),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My Saved Cards',
                    style: textStyle.headlineMedium,),
                const Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My Order', style: textStyle.headlineMedium,),
                const Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          ),
          Padding(
            padding:  const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Refer and Earn',
                    style:textStyle.headlineMedium,),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Search())));
                    },
                    child: const Icon(Icons.arrow_forward_ios_outlined))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith(((states) {
                      return states.contains(MaterialState.pressed)
                          ? Rang.blue
                          : Colors.white;
                    })),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Rang.blue, width: 2))),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(Icons.logout, color: Rang.blue),
                  Text(
                    'Log out',
                    style: textStyle.displaySmall
                  )
                ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
