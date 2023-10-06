// ignore_for_file: must_be_immutable

import 'package:appstore/constant/color/color.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/view/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constant/widget/component.dart';

class Address extends StatelessWidget {
  RxInt select = 0.obs;
  TextEditingController fullname = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController preNum = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();
  final box = GetStorage();

  Address({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: Rang.toosi),
                child: TextField(
                  controller: fullname,
                  decoration: InputDecoration(
                      hintText: 'Full name',
                      helperStyle: const TextStyle(color: Rang.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Rang.toosi),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Rang.toosi),
                    child: TextField(
                      controller: preNum,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: '49',
                          helperStyle: const TextStyle(color: Rang.grey),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Rang.toosi),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 310,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Rang.toosi),
                    child: TextField(
                      controller: number,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: 'Contact number',
                          helperStyle: const TextStyle(color: Rang.grey),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Rang.toosi),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 120,
              ),
              Text('Delivery Address', style: textStyle.bodyMedium),
              const Divider(
                thickness: 1,
                color: Rang.grey,
                endIndent: 5,
                indent: 5,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: Rang.toosi),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: pinCode,
                  decoration: InputDecoration(
                      hintText: 'Pin code',
                      helperStyle: const TextStyle(color: Rang.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Rang.toosi),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: Rang.toosi),
                child: TextField(
                  controller: street,
                  decoration: InputDecoration(
                      hintText: 'Street Address',
                      helperStyle: const TextStyle(color: Rang.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Rang.toosi),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: Rang.toosi),
                child: TextField(
                  controller: city,
                  decoration: InputDecoration(
                      hintText: 'City',
                      helperStyle: const TextStyle(color: Rang.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Rang.toosi),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
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
              ButtonWidget(
                title: 'Save Address',
                onPressed: () => _onPressed,
              )
            ]),
          ),
        ),
      ),
    );
  }

  _onPressed(context) {
    box.write('fulName', fullname.text);
    box.write('pin', pinCode.text);
    box.write('number', number.text);
    box.write('preNum', preNum.text);
    box.write('street', street.text);
    box.write('city', city.text);

    if (street.text.isNotEmpty &&
        city.text.isNotEmpty &&
        fullname.text.isNotEmpty &&
        preNum.text.isNotEmpty &&
        number.text.isNotEmpty &&
        pinCode.text.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Payments()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 27, 75, 102),
          content: SizedBox(
            height: 60,
            child: Center(
              child: Text(
                'Enter information',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontFamily: 'Auliare'),
              ),
            ),
          )));
    }
  }
}
