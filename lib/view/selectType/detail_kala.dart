// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:appstore/controller/homeScreenController.dart';


import 'package:appstore/model/Model.dart';

import 'package:appstore/color/color.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/component.dart';

import '../review/review.dart';

class DetailKala extends StatefulWidget {
  int index;
 bool? isFavorite;
   int select;
List<Kala> kalaList;
  DetailKala(
       this.index,
       this.select,
       this.kalaList ,
       {this.isFavorite}
       );

  @override
  State<DetailKala> createState() =>
      // ignore: no_logic_in_create_state
      _DetailKalaState(select,  index,  kalaList,isFavorite:isFavorite);
}

class _DetailKalaState extends State<DetailKala> {
  _DetailKalaState(
 this.select, this.index,  this.kalalist, {this.isFavorite});
  List<Kala> kalalist;
  int select;
  var box=GetStorage();
  int index;
bool ?isFavorite;
final int randomValue=Random().nextInt(500000);
  @override
  Widget build(BuildContext context) {
   return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Rang.blue,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Stack(
                children: [
                  Container(
                    height: 380,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: Image.asset(kalalist[index].ima!)
                                .image),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 30,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(110, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(Icons.view_carousel),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   kalalist[index].name!,
                    textScaleFactor: 1.9,style: textStyle.headlineMedium,
                  ),
                  Text(
                kalalist[index].brand!,
                    textScaleFactor: 1.1,
                    style: textStyle.bodyMedium,
                    strutStyle: const StrutStyle(height: 2),
                  ),
                  Row(
                    children: [
                      Text(
                       '${kalalist[index].price}\$',
                        textScaleFactor: 1.6,
                        strutStyle: const StrutStyle(height: 2),style: textStyle.bodyMedium,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        '20%OFF',
                        textScaleFactor: 1.1,
                        style: TextStyle(color: Colors.red,fontFamily:'Auliare',fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Rang.toosi,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('43.5',style: textStyle.bodyMedium,),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Icon(
                                    CupertinoIcons.star_fill,
                                    color: Rang.orange,
                                    size: 17,
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
               const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Avrange Rating',
                             
                              style: TextStyle(color: Rang.greylight,fontFamily: 'Auliare',fontWeight: FontWeight.bold),
                            ),
                            Text('43Rating and 23 Reviews',
                                style: TextStyle(color: Rang.greylight,fontFamily: 'Auliare',fontWeight: FontWeight.bold))
                          ])
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 400,
                height: 70,
                decoration: BoxDecoration(
                    border: Border.all(color: Rang.blue, width: 2),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          'Get upto 30% of on order value above \$100',
                         style: textStyle.bodyMedium,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Rang.toosi,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Use code',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Rang.grey,fontFamily: 'Auliare',fontWeight: FontWeight.bold)
                                  ),
                        Text(
                          randomValue.toString(),
                            style:textStyle.bodyMedium
                               
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {

                      setState(() {
                      
                      isFavorite = !isFavorite!;
                      box.write('fav$index', isFavorite);
                      if (isFavorite == false &&
                          wishList.contains(kalalist[index])) {
                        wishList.remove(kalalist[index]);
                      }
                      if (isFavorite == true &&
                          !wishList.contains(kalalist[index])) {
                        wishList.add(kalalist[index]);
                      }

                      debugPrint(wishList.length.toString());
});  },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Rang.toosi,
                      ),
                      child: Icon(
                          isFavorite == false
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: Rang.blue,
                       
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Rang.blue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        onPressed: (() {
                          if (!myBagList.contains(kalalist[index])) {
                            setState(() {
                                    myBagList.add(kalalist[index]);
                            debugPrint(myBagList.length.toString());
                            });
                         
                          }
                        }),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            ),
                            Text('Add to Bags',style: textStyle.headlineLarge,)
                          ],
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 18, top: 18, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('43 Rating and 23 Reviews',
                      style:textStyle.bodyMedium
                          ),
                  InkWell(
                    onTap: (() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => Review(
                              index: index,
                              select: select,
                              listkala: kalalist))));
                    }),
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                      color: Rang.blue,
                    ),
                  )
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Text('You might like also',
                      style:textStyle.bodyMedium
                          ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                width: double.infinity,
                height: 237,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: ((context, index) {
                      HomeScreenController homeScreenController=Get.put(HomeScreenController());
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 200,
                          child: Column(children: [
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        select==0?
                                        
                                        homeScreenController.skincare[index].ima!: select==1?
                                        
                                        homeScreenController.watche[index].ima!: select==2?
                                        
                                        homeScreenController.bag[index].ima!: select==3?
                                        
                                        homeScreenController.jewellery[index].ima!: select==4?
                                        
                                        homeScreenController.eyewear[index].ima!:
                                        homeScreenController.shoes[index].ima!
                                        
                                        
                                        ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(  select==0?
                                        
                                        homeScreenController.skincare[index].brand!: select==1?
                                        
                                        homeScreenController.watche[index].brand!: select==2?
                                        
                                        homeScreenController.bag[index].brand!: select==3?
                                        
                                        homeScreenController.jewellery[index].brand!: select==4?
                                        
                                        homeScreenController.eyewear[index].brand!:
                                        homeScreenController.shoes[index].brand!,style: textStyle.bodyMedium,),
                                      const Icon(
                                        Icons.favorite_border,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  Text( select==0?
                                        
                                        homeScreenController.skincare[index].name!: select==1?
                                        
                                        homeScreenController.watche[index].name!: select==2?
                                        
                                        homeScreenController.bag[index].name!: select==3?
                                        
                                        homeScreenController.jewellery[index].name!: select==4?
                                        
                                        homeScreenController.eyewear[index].name!:
                                        homeScreenController.shoes[index].name!
                                   
,style: textStyle.bodyMedium                                  ),
                                  Text(select==0?
                                    '${homeScreenController.skincare[index].price!}\$':select==1?
                                    '${homeScreenController.watche[index].price!}\$':select==2?
                                    '${homeScreenController.bag[index].price!}\$':select==3?
                                    '${homeScreenController.jewellery[index].price!}\$':select==4?
                                    '${homeScreenController.eyewear[index].price!}\$':
                                    '${homeScreenController.shoes[index].price!}\$',
                                    strutStyle: const StrutStyle(height: 2),style: textStyle.bodyMedium
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      );
                    })),
              ),
            )
          ],
        ),
      )),
    );
  }
}
