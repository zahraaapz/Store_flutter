// ignore_for_file: must_be_immutable

import 'package:appstore/constant/color/color.dart';
import 'package:appstore/route_manager/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/storage.dart';
import '../../constant/textEditController.dart';
import '../../constant/widget/widget.dart';

class Personal extends StatelessWidget {
  RxInt select = 0.obs;

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
              myTextField(
                  width: double.infinity,
                  size: Get.size,
                  hintText: 'Full Name',
                  controller: MyTextEditingController.fullName),
              const SizedBox(
                height: 15,
              ),
              myTextField(
                  width: double.infinity,
                  size: Get.size,
                  hintText: 'Contact number',
                  controller: MyTextEditingController.number),
              const SizedBox(
                height: 15,
              ),
              myTextField(
                  width: double.infinity,
                  size: Get.size,
                  hintText: 'Email Address',
                  controller: MyTextEditingController.email),
              const SizedBox(
                height: 300,
              ),
              SizedBox(
                width: double.infinity,
                child: ButtonWidget(
                  onPressed: () => _onPressed(context),
                  title: 'Save Information',
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  _onPressed(context) {
    MyStorage.box
        .write(StorageNames.fullName, MyTextEditingController.fullName.text);
    MyStorage.box
        .write(StorageNames.number, MyTextEditingController.number.text);
    MyStorage.box
        .write(StorageNames.email, MyTextEditingController.number.text);

    if (MyTextEditingController.fullName.text.isNotEmpty &&
        MyTextEditingController.email.text.isNotEmpty &&
        MyTextEditingController.number.text.isNotEmpty) {
      Get.offAllNamed(RouteNames.home);
    } else {
      massage('Enter information', context);
    }
  }
}
