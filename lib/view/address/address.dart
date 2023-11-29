// ignore_for_file: must_be_immutable

import 'package:appstore/component/extention.dart';
import 'package:appstore/constant/color.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/widget/massageSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../constant/storage.dart';
import '../../constant/textEditController.dart';
import '../../route_manager/route_name.dart';
import '../../widget/ButtonWidget.dart';
import '../../widget/iconANDtitle.dart';
import '../../widget/myTextField.dart';

class Address extends StatelessWidget {
  RxInt select = 0.obs;

  Address({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              iconANDtitle('My Address', Icons.arrow_back_ios),
                (Dim.small*5).width
,
              Text('Contact Information', style: textStyle.bodyMedium),
              const Divider(
                thickness: 1,
                color: Rang.grey,
                endIndent: 5,
                indent: 5,
              ),
              myTextField(
                maxLength: 8,
                  size: size,
                  width: double.infinity,
                  controller: MyTextEditingController.fullName,
                  hintText: 'Full Name'),
                               (Dim.medium*5).height
,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  myTextField(
                    maxLength: 4,
                      textInputType: TextInputType.number,
                      size: size,
                      controller: MyTextEditingController.preNum,
                      width: size.width /6.5,
                      hintText: '+11'),
                  myTextField(
                    maxLength: 10,
                      size: size,
                      textInputType: TextInputType.number,
                      width: size.width / 1.27,
                      controller: MyTextEditingController.number,
                      hintText: '987654321'),
                ],
              ),
                (Dim.large*6).height,

              Text('Delivery Address', style: textStyle.bodyMedium),
              const Divider(
                thickness: 1,
                color: Rang.grey,
                endIndent: 5,
                indent: 5,
              ),
              myTextField(
                maxLength: 6,
                  size: size,
                  width: double.infinity,
                  controller: MyTextEditingController.pinCode,
                  hintText: 'Pin Code'),
           
               (Dim.medium).height,

              myTextField(
                
                  size: size,
                  width: double.infinity,
                  controller: MyTextEditingController.street,
                  hintText: 'Street Address'),
                 (Dim.medium).height,

              myTextField(
                maxLength: 20,
                  size: size,
                  width: double.infinity,
                  controller: MyTextEditingController.city,
                  hintText: 'City'),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
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
             
                (Dim.large*2).height,

              SizedBox(
                width: double.infinity,
                child: ButtonWidget(
                  iconData: Icons.location_on,
                  title: 'Save Address',
                  onPressed: () => onPressed(context),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  onPressed(context) {
    MyStorage.box
        .write(StorageNames.fullName, MyTextEditingController.fullName.text);
    MyStorage.box.write(StorageNames.pin, MyTextEditingController.pinCode.text);
    MyStorage.box
        .write(StorageNames.number, MyTextEditingController.number.text);
    MyStorage.box
        .write(StorageNames.preNum, MyTextEditingController.preNum.text);
    MyStorage.box
        .write(StorageNames.street, MyTextEditingController.street.text);
    MyStorage.box.write(StorageNames.city, MyTextEditingController.city.text);

    if (MyTextEditingController.street.text.isNotEmpty &&
        MyTextEditingController.city.text.isNotEmpty &&
        MyTextEditingController.fullName.text.isNotEmpty &&
        MyTextEditingController.preNum.text.isNotEmpty &&
        MyTextEditingController.number.text.isNotEmpty &&
        MyTextEditingController.pinCode.text.isNotEmpty) {
      Get.toNamed(RouteNames.payment);
    } else {
      massageSnackbar('Enter information', context);
    }
  }
}
