// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:appstore/view/address/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../constant/color/color.dart';
import '../../constant/text_style.dart';
import '../../constant/widget/widget.dart';

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
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Delivering to', style: textStyle.bodyMedium),
                        const SizedBox(
                          height: 10,
                        ),
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
                                    Address().box.read('street'),
                                    style: textStyle.bodyMedium,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    Address().box.read('city'),
                                    style: textStyle.bodyMedium,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  //To do:edit
                                  Get.offAll(Address());
                                },
                                child: Container(
                                    height: 50,
                                    width: 70,
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
                        const SizedBox(height: 10),
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
                        const SizedBox(height: 10),
                        Container(
                            width: double.infinity,
                            height: 230,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Select Payment Method',
                                    style: textStyle.bodyMedium),
                                const SizedBox(height: 15),
                                Text('Debit Card/Credit Card',
                                    style: textStyle.bodyMedium),
                                const SizedBox(height: 15),
                                Text('UPI', style: textStyle.bodyMedium),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    const SizedBox(width: 9),
                                    SvgPicture.asset(
                                      'assets/image/google.svg',
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Google pay',
                                      style: textStyle.bodyMedium,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/image/Paytm.svg',
                                      width: 35,
                                      height: 35,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'paytm',
                                      style: textStyle.bodyMedium,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const SizedBox(width: 12),
                                    SvgPicture.asset(
                                      'assets/image/phonepe.svg',
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Phonepe',
                                      style: textStyle.bodyMedium,
                                    )
                                  ],
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 80,
                        ),
                       const SizedBox(
                        width: double.infinity,
                         child: ButtonWidget(
                          title: 'Pay now',
                         ),
                       )
                      ]),
                ))));
  }
}
