import 'package:appstore/address.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color/color.dart';
import 'model/component.dart';

class Payments extends StatelessWidget {

  TextEditingController street=TextEditingController();
  TextEditingController city=TextEditingController();

  Payments(this.city,this.street);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                      Text(city.text ,style: TextStyle(color: Colors.black),),
                      SizedBox(width: 10,)
,                      Text(street.text,style: TextStyle(color: Colors.black),),

                    ],
                  ),
                  
             GestureDetector(

              onTap: () {
                //to do:edit
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

            )
            
            
        ]))));             
}

}
