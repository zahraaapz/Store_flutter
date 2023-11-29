// ignore_for_file: must_be_immutable

import 'package:appstore/component/extention.dart';
import 'package:appstore/constant/color.dart';
import 'package:appstore/route_manager/route_name.dart';
import 'package:appstore/widget/massageSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/dim.dart';
import '../../constant/storage.dart';
import '../../constant/textEditController.dart';
import '../../widget/ButtonWidget.dart';
import '../../widget/iconANDtitle.dart';
import '../../widget/myTextField.dart';

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
              (Dim.small).height,
              const Text('Contact Information', style: TextStyle(fontSize: 16)),
              const Divider(
                thickness: 1,
                color: Rang.grey,
                endIndent: 5,
                indent: 5,
              ),
              myTextField(
                  maxLength: 8,
                  width: double.infinity,
                  size: Get.size,
                  hintText: 'Full Name',
                  controller: MyTextEditingController.fullName),
              (Dim.medium + 3).height,
              myTextField(
                  textInputType: TextInputType.number,
                  maxLength: 10,
                  width: double.infinity,
                  size: Get.size,
                  hintText: '987654321',
                  controller: MyTextEditingController.number),
              (Dim.medium + 3).height,
              myTextField(
                  maxLength: 20,
                  width: double.infinity,
                  size: Get.size,
                  hintText: 'Email Address',
                  controller: MyTextEditingController.email),
            
              (Dim.medium + 3).height,
              myTextField(
                  maxLength: 20,
                  width: double.infinity,
                  size: Get.size,
                  hintText: 'Username',
                  controller: MyTextEditingController.userName),
            
              (Dim.medium + 3).height,
              myTextField(
                  maxLength: 20,
                  width: double.infinity,
                  size: Get.size,
                  hintText: 'Password',
                  controller: MyTextEditingController.password),
                (Dim.medium + 3).height,
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
      massageSnackbar('Enter information', context);
    }
  }
}
