// ignore_for_file: must_be_immutable

import 'package:appstore/constant/color/color.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/view/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../constant/text_style.dart';
import '../../constant/widget/widget.dart';
import '../profile/personal_info.dart';

class Address extends StatelessWidget {
  RxInt select = 0.obs;
  TextEditingController fullname = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController preNum = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();

 Address({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
              iconANDtitle('My Address', Icons.arrow_back_ios),
              const SizedBox(
                height: 9,
              ),
              Text('Contact Information', style: textStyle.bodyMedium),
              const Divider(
                thickness: 1,
                color: Rang.grey,
                endIndent: 5,
                indent: 5,
              ),
              myTextField(size: size,width: double.infinity,controller: fullname,hintText: 'Full Name'),
              const SizedBox(
                height: 15,
              ),
              Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               myTextField(size: size,controller: preNum,width: size.width/7.5,hintText: '49'),
               myTextField(size: size,width:size.width/1.25,controller: number,hintText: 'Concate Number'),

              
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text('Delivery Address', style: textStyle.bodyMedium),
              const Divider(
                thickness: 1,
                color: Rang.grey,
                endIndent: 5,
                indent: 5,
              ),

       myTextField(size: size,width: double.infinity,controller: pinCode,hintText: 'Pin Code'),
   const SizedBox(
                height: 15,
              ),
         myTextField(size: size,width: double.infinity,controller: street,hintText:'Street Address' ),

              const SizedBox(
                height: 15,
              ),
         myTextField(size: size,width: double.infinity,controller: city,hintText:'City' ),
           SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          select.value = index;
                        },
                        child: Obx(
                          () => Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                                color: select.value == index
                                    ? Rang.blue
                                    : Rang.toosi,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              addresslist[index],
                              style: TextStyle(
                                  color: select.value == index
                                      ? Colors.white
                                      : Rang.grey,
                                  fontFamily: 'Auliare'),
                            )),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: ButtonWidget(
                  iconData: Icons.location_on,
                  title: 'Save Address',
                  onPressed: ()=> onPressed(context),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }



  onPressed(context) {
    Personal().box.write('fulName', fullname.text);
    Personal().box.write('pin', pinCode.text);
    Personal().box.write('number', number.text);
    Personal().box.write('preNum', preNum.text);
    Personal().box.write('street', street.text);
    Personal().box.write('city', city.text);

    if (street.text.isNotEmpty &&
        city.text.isNotEmpty &&
        fullname.text.isNotEmpty &&
        preNum.text.isNotEmpty &&
        number.text.isNotEmpty &&
        pinCode.text.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Payments()));
    } else {

      massage('Enter information',context);
 
    }
  }
}
