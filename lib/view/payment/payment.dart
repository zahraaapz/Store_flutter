// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:appstore/component/extention.dart';
import 'package:appstore/route_manager/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../constant/color.dart';
import '../../constant/storage.dart';
import '../../widget/ButtonWidget.dart';
import '../../widget/iconANDtitle.dart';

class Payments extends StatelessWidget {
  const Payments({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Rang.toosi,
            body: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            color: Colors.white,
                            child:
                                iconANDtitle('Payment', Icons.arrow_back_ios)),
                       (Dim.large).height,
                        Text('Delivering to', style: textStyle.bodyMedium),
                       (Dim.large).height,
                        Container(
                          width: double.infinity,
                          height: 80,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                MyStorage.box.read(StorageNames.street),
                                    style: textStyle.bodyMedium,
                                  ),
                                 
                                   (Dim.large/2).width,
                                  Text(
                              MyStorage.box.read(StorageNames.city),
                                    style: textStyle.bodyMedium,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  //To do:edit
                                  Get.off(RouteNames.address);
                                },
                                child: Container(
                                    height: Get.height/14.5,
                                    width: Get.width/7,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Rang.blue),
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        (Dim.large/2).height,
                        Container(
                            width: double.infinity,
                            height: 50,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Product Details',
                                    style: textStyle.bodyMedium),
                              ],
                            )),
                        (Dim.large/2).height,
                        Container(
                            width: double.infinity,
                            height: 230,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                (Dim.large/2).height,
                                Text('Select Payment Method',
                                    style: textStyle.bodyMedium),
                                (Dim.medium).height,
                                Text('Debit Card/Credit Card',
                                    style: textStyle.bodyMedium),
                                (Dim.medium).height,
                                Text('UPI', style: textStyle.bodyMedium),
                                (Dim.medium).height,
                                Row(
                                  children: [
                                     (Dim.large/2).width,
                                    SvgPicture.asset(
                                      'assets/image/google.svg',
                                      width: Get.width/20,
                                      height: Get.height/25,
                                    ),
                                    (Dim.large/2).width,
                                    Text(
                                      'Google pay',
                                      style: textStyle.bodyMedium,
                                    )
                                  ],
                                ),
                                (Dim.large/2).height,
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/image/Paytm.svg',
                                        width: Get.width/19,
                                      height: Get.height/20,
                                    ),
                                    (Dim.small/2).width,
                                    Text(
                                      'paytm',
                                      style: textStyle.bodyMedium,
                                    )
                                  ],
                                ),
                                (Dim.large/2).height,
                                Row(
                                  children: [
                                    (Dim.medium).width,
                                    SvgPicture.asset(
                                      'assets/image/phonepe.svg',
                                         width: Get.width/20,
                                      height: Get.height/22,
                                    ),
                                    (Dim.medium).width,
                                    Text(
                                      'Phonepe',
                                      style: textStyle.bodyMedium,
                                    )
                                  ],
                                )
                              ],
                            )),
                        (Dim.large*4).height,
                      SizedBox(
                        width: double.infinity,
                         child: ButtonWidget(
                          title: 'Pay now',
                          onPressed: () => Get.offNamed(RouteNames.home),
                         ),
                       )
                      ]),
                ))));
  }
}
