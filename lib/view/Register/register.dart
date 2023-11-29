import 'package:appstore/component/extention.dart';
import 'package:appstore/component/text_style.dart';
import 'package:appstore/constant/textEditController.dart';
import 'package:appstore/widget/ButtonWidget.dart';
import 'package:appstore/widget/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/dim.dart';
import '../../constant/storage.dart';
import '../../route_manager/route_name.dart';
import '../../widget/massageSnackbar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                Dim.large.height,
                Text(
                  'Enter your \n Information',
                  style: textStyle.displayLarge,
                ),
              Dim.large.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myTextField(
                      maxLength: 4,
                      controller: MyTextEditingController.preNum,
                      textInputType: TextInputType.number,
                      size: Get.size,
                      width: Get.width /6.5,
                      hintText: '+11',
                    ),
                    myTextField(
                      controller: MyTextEditingController.number,
                      size: Get.size,
                      width: Get.width / 1.25,
                      hintText: '987654321',
                      textInputType: TextInputType.number,
                      maxLength: 10
                    ),
                  ],
                ),
              Dim.large.height,
                myTextField(
                  maxLength: 20,
                  controller: MyTextEditingController.email,
                  size: Get.size,
                  width: Get.width / 1.02,
                  hintText: 'MyAccount@gmail.com',
                ),
              Dim.large.height,
                myTextField(
                  controller: MyTextEditingController.userName,
                  size: Get.size,
                  width: Get.width / 1.02,
                  hintText: 'Username',
                  maxLength: 9
                ),
              Dim.large.height,
                myTextField(
                  controller: MyTextEditingController.password,
                  size: Get.size,
                  width: Get.width / 1.02,
                  hintText: 'Password',
                  maxLength: 8
                ),Dim.large.height,
                myTextField(
                  controller: MyTextEditingController.fullName,
                  size: Get.size,
                  width: Get.width / 1.02,
                  hintText: 'Full Name',
                  maxLength: 8
                ),
              Dim.large.height,
                SizedBox(
                  width: double.infinity,
                  child: ButtonWidget(
                    title: 'Next',
                    onPressed: () {
                      MyStorage.box.write(StorageNames.preNum,
                          MyTextEditingController.preNum.text);
                      MyStorage.box.write(StorageNames.number,
                          MyTextEditingController.number.text);
                      MyStorage.box.write(StorageNames.email,
                          MyTextEditingController.email.text);
                      MyStorage.box.write(StorageNames.password,
                          MyTextEditingController.password.text);
                      MyStorage.box.write(StorageNames.userName,
                          MyTextEditingController.userName.text);
                      MyStorage.box.write(StorageNames.fullName,
                          MyTextEditingController.fullName.text);

                      if (MyTextEditingController.fullName.text.isNotEmpty &&
                          MyTextEditingController.userName.text.isNotEmpty &&
                          MyTextEditingController.preNum.text.isNotEmpty &&
                          MyTextEditingController.number.text.isNotEmpty &&
                          MyTextEditingController.password.text.isNotEmpty) {
                              Get.offNamed(RouteNames.home);
                      } else {
                        massageSnackbar('Enter information', context);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
