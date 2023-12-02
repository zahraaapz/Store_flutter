// ignore_for_file: must_be_immutable

import 'package:appstore/model/Model.dart';
import 'package:appstore/constant/color.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chart extends StatelessWidget {
  Chart({super.key, required this.comment});
  List<Comment> comment = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 5,
      child: DChartBarO(
        vertical: false,
        insideBarLabelStyle: (group, ordinalData, index) =>
            const LabelStyle(color: Colors.white, fontSize: 10),
        barLabelValue: (group, ordinalData, index) =>
            '${ordinalData.measure} member',
        barLabelDecorator:
            BarLabelDecorator(labelAnchor: BarLabelAnchor.middle),
        animationDuration: const Duration(milliseconds: 200),
        groupList: [
          OrdinalGroup(
            color: Rang.blue,
            id: 'Bar',
            data: [
              OrdinalData(domain: '1', measure: comment[0].score),
              OrdinalData(domain: '2', measure: comment[1].score),
              OrdinalData(domain: '3', measure: comment[2].score),
              OrdinalData(domain: '4', measure: comment[3].score),
              OrdinalData(domain: '5', measure: comment[4].score),
            ],
          )
        ],
        // domainLabelPaddingToAxisLine: 1,
        // axisLineTick: 1,
        // axisLinePointTick: 1,
        // axisLinePointWidth: 1,
        // axisLineColor: Rang.blue,
        // measureLabelPaddingToAxisLine: 1,
        // showMeasureLine: true,
        // barColor: (barData, index, id) => Rang.blue,
        // showBarValue: false,
      ),
    );
  }
}
