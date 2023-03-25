import 'package:appstore/Model.dart';
import 'package:appstore/main_handbag.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'chart.dart';
import 'color.dart';

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
  static List<Comment> comment = [];
  List<Kala> listkala = [];
  int index, select;
  _ReviewState(
      {required this.listkala, required this.index, required this.select});
  Future getcomment() async {
    var url = 'http://api.npoint.io/9139bbcee841b54f273f';
    var value = await http.get(Uri.parse(url));

    List json = convert.jsonDecode(value.body);
    if (2 + 2 == 4) {
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
    return FutureBuilder(
      builder: (context, snapshot) {
        return snapshot.hasData
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: Column(children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) => Main_handbag(
                                          index: index,
                                          select: select,
                                          Kalalist: listkala))));
                                }),
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Rang.blue,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        child: Row(children: [
                                      Text(
                                          "${(comment[0].score + comment[1].score + comment[2].score + comment[3].score + comment[4].score) / 5}"),
                                      const Icon(
                                        CupertinoIcons.star_fill,
                                        color: Rang.orange,
                                        size: 20,
                                      ),
                                    ])),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    const Text(
                                      'Avrage Rating',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              chart(
                                comment: comment,
                              ),
                              ExpandableNotifier(
                                  child: ScrollOnExpand(
                                      child: Expandable(
                                collapsed: collapseComment(context, comment),
                                expanded: expandedComment(context, comment),
                              ))),
                            ],
                          )),
                    ]),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
      future: getcomment(),
    );
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
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
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
                  Text(comment[1].name),
                  Text(comment[1].date),
                ],
              ),
            ),
          ],
        ),
        Text(comment[1].review),
        Builder(
          builder: (context) {
            var controller = ExpandableController.of(context, required: true)!;
            return InkWell(
              child: const Text(
                'more',
                style: TextStyle(color: Rang.grey),
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
        height: 460,
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
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
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
                                Text(comment[index].name),
                                Text(comment[index].date),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(comment[index].review),
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
            child: const Text(
              'less',
              style: TextStyle(color: Rang.grey),
            ));
      })
    ],
  );
}
