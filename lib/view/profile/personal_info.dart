// ignore_for_file: must_be_immutable

import 'package:appstore/constant/color/color.dart';
import 'package:appstore/view/firstScreen/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../constant/widget/widget.dart';

class Personal extends StatelessWidget {
  var box = GetStorage();
  RxInt select = 0.obs;
  TextEditingController fullname = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();

  Personal({super.key});

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
              iconANDtitle('My Information', Icons.arrow_back_ios),
              const SizedBox(
                height: 9,
              ),
              const Text('Contact Information', style: TextStyle(fontSize: 16)),
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
                      helperStyle: TextStyle(color: Rang.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Rang.toosi),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: Rang.toosi),
                child: TextField(
                  controller: number,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: 'Contact number',
                      helperStyle: TextStyle(color: Rang.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Rang.toosi),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: Rang.toosi),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      hintText: 'Email Address',
                      helperStyle: TextStyle(color: Rang.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Rang.toosi),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
         ButtonWidget(
          onPressed: ()=>_onPressed(context),
          title: 'Save Information',
          
         )
            ]),
          ),
        ),
      ),
    );
  }
                    _onPressed (context) {
                    box.write('fullName', fullname.text);
                    box.write('email', email.text);
                    box.write('number', number.text);

                    if (fullname.text.isNotEmpty &&
                        email.text.isNotEmpty &&
                        number.text.isNotEmpty) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor:
                              const Color.fromARGB(255, 27, 75, 102),
                          content: SizedBox(
                            height: 60,
                            child: Center(
                              child: Text(
                                'Enter information',
                                style: textStyle.headlineLarge,
                              ),
                            ),
                          )));
                    }
                  }
}
