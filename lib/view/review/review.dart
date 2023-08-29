// ignore_for_file: must_be_immutable

import 'package:appstore/color/color.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/model/component.dart';

import 'package:appstore/view/selectType/detail_kala.dart';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'chart.dart';

class Review extends StatefulWidget {
  Review(
      {super.key,
      required this.listkala,
      required this.index,
      required this.select});
  List<Kala> listkala = [];
  int index, select;

  @override
  State<Review> createState() =>
      _ReviewState(index: index, select: select, listkala: listkala);
}

class _ReviewState extends State<Review> {
  List<Comment> comment = [];
  List<Kala> listkala = [];
  int index, select;
  _ReviewState(
      {required this.listkala, required this.index, required this.select});
  Future getcomment() async {
    var url = 'http://api.npoint.io/9139bbcee841b54f273f';
    var value = await http.get(Uri.parse(url));

    List json = convert.jsonDecode(value.body);
    if (comment.isEmpty) {
      ///:(
      for (int i = 0; i < json.length; i++) {
        setState(() {
          comment.add(Comment(
              date: json[i]['date'],
              name: json[i]['name'],
              time: json[i]['time'],
              score: json[i]['score'],
              review: json[i]['review']));
        });
      }
      return value;
    }
  }

  @override
  void initState() {
    super.initState();
    getcomment();
  }

  @override
  Widget build(BuildContext context) {
        return   Scaffold(
                backgroundColor: Colors.white,
                body:
                comment.isNotEmpty?
                 SingleChildScrollView(
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
                                  IconButton(
                                      onPressed: (() {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    DetailKala(
                                                        index,
                                                        select,
                                                        listkala))));
                                      }),
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                        color: Rang.blue,
                                      )),
                                  Text(
                                      "${(comment[0].score + comment[1].score + comment[2].score + comment[3].score + comment[4].score) / 5}"
                                      
                                      ,style: textStyle.bodyMedium,),
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
                                  'Avrage Rating'
                                 ,style: textStyle.bodyMedium,
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
                ):SpinKitCircle(
                color: Rang.blue,
              ),
              )
        
    ;
  }
}

collapseComment(context, List<Comment> comment) {
  return Container(
    height: 80,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Rang.toosi, borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(comment[1].score.toString(),
                        style: textStyle.bodyMedium,),
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: Rang.orange,
                      size: 20,
                    ),
                  ],
                )),
            SizedBox(
              width: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comment[1].name,style: textStyle.bodyMedium,),
                  Text(comment[1].date,style: textStyle.bodyMedium,),
                ],
              ),
            ),
          ],
        ),
        Text(comment[1].review,style: textStyle.bodyMedium,),
        SizedBox(height: 5,),
        Builder(
          builder: (context) {
            var controller = ExpandableController.of(context, required: true)!;
            return InkWell(
              child:  Text(
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
        height: 490,
        child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Rang.toosi,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(comment[index].score.toString(),
                                     style: textStyle.bodyMedium,),
                                  const Icon(
                                    CupertinoIcons.star_fill,
                                    color: Rang.orange,
                                    size: 20,
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(comment[index].name,style: textStyle.bodyMedium,),
                                Text(comment[index].date,style: textStyle.bodyMedium,),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(comment[index].review,style: textStyle.bodyMedium,),
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
            child:  Text(
              'less',
              style: textStyle.bodySmall,
            ));
      })
    ],
  );
}

write() {
  return Column(children: [
     SizedBox(height: 300,),
    Builder(builder: (context) {
      var controller = ExpandableController.of(context, required: true)!;
      
      return Container(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                backgroundColor: MaterialStateProperty.all(Rang.blue)),
            onPressed: () {
              controller.toggle();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add),
                SizedBox(
                  width: 8,
                ),
                Text('Write a Review',style: textStyle.headlineLarge,),
              ],
            )),
      );
    })
  ]);
}

descripe() {
  return Builder(builder: (context) {
    var controller = ExpandableController.of(context, required: true)!;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Review Description',style: textStyle.bodyMedium,),
      SizedBox(
        height: 12,
      ),
      Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Rang.toosi),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Rang.toosi)),
              hintText: 'Enter Description',
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15))),
        ),
      ),
     SizedBox(height: 100,)
      ,
      SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
              backgroundColor: MaterialStateProperty.all(Rang.blue),
            ),
            onPressed: () {
              controller.toggle();
              _snackbar(context);
            },
            child: Row(
              children: [
                Icon(Icons.add),
                SizedBox(
                  width: 8,
                ),
                Text('Save',style: textStyle.headlineLarge,),
              ],
            )),
      )
    ]);
  });
}

_snackbar(context) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Rang.blue, content: Text('Saved :)',style: textStyle.headlineLarge)));
}
