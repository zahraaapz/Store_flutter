// ignore_for_file: must_be_immutable

import 'package:appstore/constant/color.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/service/service.dart';
import 'package:appstore/widget/massageSnackbar.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
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

 var response = await DioService().getList('https://api.npoint.io/9139bbcee841b54f273f');
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: comment.isNotEmpty
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
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
                            const SizedBox(
                              width: 12,
                            ),
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
                  )),
            )
          : const SpinKitCircle(
              color: Rang.blue,
            ),
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
            const SizedBox(
              width: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment[1].name,
                    style: textStyle.bodyMedium,
                  ),
                  Text(
                    comment[1].date,
                    style: textStyle.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          comment[1].review,
          style: textStyle.bodyMedium,
        ),
        const SizedBox(
          height: 5,
        ),
        Builder(
          builder: (context) {
            var controller = ExpandableController.of(context, required: true)!;
            return InkWell(
              child: Text(
                'more',
                style: textStyle.bodySmall,
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
                          const SizedBox(
                            width: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comment[index].name,
                                  style: textStyle.bodyMedium,
                                ),
                                Text(
                                  comment[index].date,
                                  style: textStyle.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        comment[index].review,
                        style: textStyle.bodyMedium,
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
            child: Text(
              'less',
              style: textStyle.bodySmall,
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

      return SizedBox(
        width: double.infinity,
        child: ButtonWidget(
          iconData: Icons.add,
          title: 'Write a Review',
          onPressed: () => controller.toggle(),
        ),
      );
    })
  ]);
}

descripe() {
  return Builder(builder: (context) {
    var controller = ExpandableController.of(context, required: true)!;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Review Description',
        style: textStyle.bodyMedium,
      ),
      SizedBox(
        height: 20,
      ),
      Container(
          height: Get.height / 4,
          padding: const EdgeInsets.all(4),
          child: myTextField(
              hintText: 'Enter Description',
              size: Get.size,
              width: double.infinity)),
      const SizedBox(
        height: 80,
      ),
      SizedBox(
        width: double.infinity,
        child: ButtonWidget(
          onPressed: () => _onPressed(context, controller),
          title: 'Save',
        ),
      )
    ]);
  });
}

_onPressed(context, controller) {
  controller.toggle();
  massageSnackbar('Saved :)', context);
}
