// ignore_for_file: must_be_immutable

import 'package:appstore/constant/color.dart';
import 'package:appstore/model/Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/storage.dart';
import '../../constant/textEditController.dart';
import '../../constant/text_style.dart';
import '../../constant/widget/widget.dart';
import '../../route_manager/route_name.dart';

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
              myTextField(
                  size: size,
                  width: double.infinity,
                  controller: MyTextEditingController.fullName,
                  hintText: 'Full Name'),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  myTextField(
                      size: size,
                      controller: MyTextEditingController.preNum,
                      width: size.width / 7.5,
                      hintText: '49'),
                  myTextField(
                      size: size,
                      width: size.width / 1.25,
                      controller: MyTextEditingController.number,
                      hintText: 'Concate Number'),
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
              myTextField(
                  size: size,
                  width: double.infinity,
                  controller: MyTextEditingController.pinCode,
                  hintText: 'Pin Code'),
              const SizedBox(
                height: 15,
              ),
              myTextField(
                  size: size,
                  width: double.infinity,
                  controller: MyTextEditingController.street,
                  hintText: 'Street Address'),
              const SizedBox(
                height: 15,
              ),
              myTextField(
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
              const SizedBox(
                height: 40,
              ),
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
      massage('Enter information', context);
    }
  }
}
