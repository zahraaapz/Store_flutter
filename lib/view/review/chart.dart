import 'package:appstore/model/Model.dart';
import 'package:appstore/color/color.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class chart extends StatelessWidget {
  chart({super.key, required this.comment});
  List<Comment> comment = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: DChartBar(
        verticalDirection: false,
        data: [
          {
            'id': 'Bar',
            'data': [
              {'domain': '1', 'measure': comment[0].score},
              {'domain': '2', 'measure': comment[1].score},
              {'domain': '3', 'measure': comment[2].score},
              {'domain': '4', 'measure': comment[3].score},
              {'domain': '5', 'measure': comment[4].score},
            ],
          },
        ],
        domainLabelPaddingToAxisLine: 1,
        axisLineTick: 1,
        axisLinePointTick: 1,
        axisLinePointWidth: 1,
        axisLineColor: Rang.blue,
        measureLabelPaddingToAxisLine: 1,
        showMeasureLine: true,
        barColor: (barData, index, id) => Rang.blue,
        showBarValue: false,
      ),
    );
  }
}
