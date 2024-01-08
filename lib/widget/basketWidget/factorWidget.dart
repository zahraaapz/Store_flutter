import 'package:appstore/component/extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/storage.dart';
import '../../component/text_style.dart';
import '../../constant/color.dart';
import '../../constant/dim.dart';
import '../../model/Model.dart';
import '../../route_manager/route_name.dart';

class factorWidget extends StatelessWidget {
  factorWidget({
    super.key,
    required this.totalPrice,
    required this.size,
  });

  double totalPrice;
  var size;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Dim.medium.height,
      Text('Order detail', style: textStyle.displaySmall),
      SizedBox(
        height: size.height / 5,
        child: ListView.builder(
            itemCount: orderDetail.length,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, ix) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(orderDetail[ix].title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Auliare',
                              fontSize: 16,
                              color: Rang.greylight)),
                      Text(orderDetail[ix].price!, style: textStyle.bodyMedium),
                    ],
                  ),
                )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Bag Amount', style: textStyle.bodyMedium),
              Text(totalPrice.toString(), style: textStyle.bodyMedium),
            ],
          ),
          ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                  backgroundColor: MaterialStateProperty.all(Rang.blue)),
              onPressed: (() {
                MyStorage.box.read(StorageNames.street) == null
                    ? Get.toNamed(RouteNames.address)
                    : Get.toNamed(RouteNames.payment);
              }),
              child: Text('Place Order', style: textStyle.headlineLarge)),
        ],
      )
    ]);
  }
}