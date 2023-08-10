// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:appstore/address.dart';
import 'package:appstore/view/firstScreen/mainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'color/color.dart';
import 'model/component.dart';

class Payments extends StatelessWidget {



 
  Payments();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              iconANDtitle('Payment', Icons.arrow_back_ios),
          
              SizedBox(height: 10,),
              Text('Delivering to'),
          
              Container(
                width: double.infinity,
                height: 100,
                color: Rang.toosi,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
          
                    Row(
                      children: [
                        Text(Address().box.read('street') ,style: TextStyle(color: Colors.black),),
                        SizedBox(width: 10,)
          ,                      Text(Address().box.read('city'),style: TextStyle(color: Colors.black),),
          
                      ],
                    ),
                    
               GestureDetector(
          
                onTap: () {
                  //To do:edit
                  Get.offAll(Address());
                },
                 child: Container(
                       
                  height: 50,
                       
                  width: 70,
                       
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Rang.blue ),
                       
                  child: Icon(Icons.edit,color: Colors.white,)
                       
                           ),
               ),
                  ],
                ),
          
              ),
              SizedBox(height:10),
              Container(
                width:double.infinity,
               height:50 ,
                color: Rang.toosi,
                child:Text('Product Detail')
              ),SizedBox(height:10),
               Container(
                width:double.infinity,
                height: 150,
                color: Rang.toosi,
                child: Column(
                  children: [
          SizedBox(height:15),
                    Row(
                      children: [
                      SizedBox(width:9), 
                     SvgPicture.asset('assets/google.svg',width: 30,height: 30,),
                     SizedBox(width:10),
                        Text('Google pay' ,)
                      ], ),
          SizedBox(height:10),
                      Row(
                      children: [  
                        SvgPicture.asset('assets/Paytm.svg',width: 35,height: 35,),
                     SizedBox(width:4),
          
                        Text('paytm' ,)
                      ],) 
                      ,SizedBox(height:10),
                      Row(
                      children: [  
                       SizedBox(width:12),  
                     SvgPicture.asset('assets/phonepe.svg',width: 30,height: 30,),
                     SizedBox(width:12),
          
                        Text('Phonepe' ,)
                      ],)
                    
                  
                  ],
                )
              ),
                 SizedBox(
                    width: double.infinity,
                height: 50,
                   child: ElevatedButton(onPressed: (){Get.to(Home());}, style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    backgroundColor: MaterialStateProperty.all(Rang.blue)),
                               child:const Text('Pay now')),
                 )
              
                  ]),
          ))));             
}

}
