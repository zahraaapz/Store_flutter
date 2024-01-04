import 'package:appstore/component/extention.dart';
import 'package:appstore/component/text_style.dart';
import 'package:appstore/constant/storage.dart';
import 'package:appstore/constant/textEditController.dart';
import 'package:appstore/widget/ButtonWidget.dart';
import 'package:appstore/widget/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/dim.dart';
import '../../route_manager/route_name.dart';

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
                  hintText: 'Myaccount@gmail.com',
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



                       MyStorage().saveInfo();
                             
        
                      if (
                        MyStorage().checkCondition()
                          ) {
                              Get.offNamed(RouteNames.home);
                      } else {
                    
                        Get.snackbar('Information', 'Enter your information');

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
