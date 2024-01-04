// ignore_for_file: must_be_immutable

import 'package:appstore/component/extention.dart';
import 'package:appstore/constant/color.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/service/service.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../widget/ButtonWidget.dart';
import '../../widget/iconANDtitle.dart';
import '../../widget/myTextField.dart';
import 'chart.dart';

class Review extends StatefulWidget {
  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  List<Comment> comment = [];
  getcomment() async {
    var response = await DioService()
        .getList('https://api.npoint.io/9139bbcee841b54f273f');
    if (comment.isEmpty) {
      response.data.forEach((element) {
        setState(() {
          comment.add(Comment.fromJson(element));
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getcomment();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: comment.isNotEmpty
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            SizedBox(
                                child: Row(children: [
                              iconANDtitle('Review', Icons.arrow_back_ios_new),
                              Text(
                                "${(comment[0].score + comment[1].score + comment[2].score + comment[3].score + comment[4].score) / 5}",
                                style: textStyle.bodyMedium,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Rang.orange,
                                size: 20,
                              ),
                            ])),
                            (Dim.small / 2).width,
                            Text(
                              'Avrage Rating',
                              style: textStyle.bodyMedium,
                            )
                          ],
                        ),
                      ),
                      Chart(
                        comment: comment,
                      ),
                      ExpandableNotifier(
                          child: ScrollOnExpand(
                              child: Expandable(
                        collapsed: collapseComment(context, comment),
                        expanded: expandedComment(context, comment),
                      ))),
                      ExpandableNotifier(
                          child: ScrollOnExpand(
                              child: Expandable(
                        collapsed: write(),
                        expanded: descripe(),
                      ))),
                    ],
                  ),
                )
              : const SpinKitCircle(
                  color: Rang.blue,
                )),
    );
  }
}

collapseComment(context, List<Comment> comment) {
  return SizedBox(
    height: Get.height / 10,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Dim.small.width,
            Container(
                height: Get.height / 20,
                width: Get.width / 9,
                decoration: BoxDecoration(
                    color: Rang.toosi, borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      comment[1].score.toString(),
                      style: textStyle.bodyMedium,
                    ),
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: Rang.orange,
                      size: 20,
                    ),
                  ],
                )),
            (Dim.small - 2).width,
            Text(
              '${comment[1].name}\n${comment[1].date}',
              style: textStyle.bodyMedium,
            ),
          ],
        ),
        (Dim.large / 4).height,
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            comment[1].review,
            style: textStyle.bodyMedium,
          ),
        ),
        (Dim.large / 4).height,
        Builder(
          builder: (context) {
            var controller = ExpandableController.of(context, required: true)!;
            return InkWell(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'more',
                  style: textStyle.bodySmall,
                ),
              ),
              onTap: () {
                controller.toggle();
              },
            );
          },
        ),
      ],
    ),
  );
}

expandedComment(context, List<Comment> comment) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      SizedBox(
        height: Get.height / 1.5,
        child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: Get.height / 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          (Dim.medium - 2).width,
                          Container(
                              height: Get.height / 15,
                              width: Get.width / 10,
                              decoration: BoxDecoration(
                                  color: Rang.toosi,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    comment[index].score.toString(),
                                    style: textStyle.bodyMedium,
                                  ),
                                  const Icon(
                                    CupertinoIcons.star_fill,
                                    color: Rang.orange,
                                    size: 20,
                                  ),
                                ],
                              )),
                          (Dim.medium - 2).width,
                          Text(
                            comment[index].name + '\n' + comment[index].date,
                            style: textStyle.bodyMedium,
                          ),
                        ],
                      ),
                      (Dim.small).height,
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          comment[index].review,
                          style: textStyle.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })),
      ),
      Builder(builder: (context) {
        var controller = ExpandableController.of(context, required: true)!;

        return InkWell(
            onTap: () => controller.toggle(),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'less',
                style: textStyle.bodySmall,
              ),
            ));
      })
    ],
  );
}

write() {
  return Column(children: [
    SizedBox(
      height: Get.height / 25,
    ),
    Builder(builder: (context) {
      var controller = ExpandableController.of(context, required: true)!;

      return Center(
        child: SizedBox(
          width: Get.width / 1.3,
          child: ButtonWidget(
            iconData: Icons.add,
            title: 'Write a Review',
            onPressed: () => controller.toggle(),
          ),
        ),
      );
    })
  ]);
}

descripe() {
  return Builder(builder: (context) {
    var controller = ExpandableController.of(context, required: true)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Review Description',
          style: textStyle.bodyMedium,
        ),
        (Dim.large).height,
        myTextField(
          border:false,
            height: Get.height / 4,
            hintText: 'Enter Description',
            size: Get.size,
            width: double.infinity),
        (Dim.large).height,
        SizedBox(
          width: double.infinity,
          child: ButtonWidget(
            onPressed: () => _onPressed(context, controller),
            title: 'Save',
          ),
        )
      ]),
    );
  });
}

_onPressed(context, controller) {
  controller.toggle();
  Get.snackbar('Review', 'Saved :)');
  
 
}
