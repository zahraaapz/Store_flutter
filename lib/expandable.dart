import 'dart:ffi';

import 'package:appstore/color.dart';
import 'package:expandable/expandable.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Expandablee extends StatelessWidget {
  const Expandablee({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: ScrollOnExpand(
      child: Expandable(
        collapsed: collapse(context),
        expanded: Expandd(context),
      ),
    ));
  }
}

collapse(context) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'More about CORA’L',
                style: TextStyle(color: Rang.blue),
              ),
              Builder(builder: (context) {
                var controller =
                    ExpandableController.of(context, required: true)!;
                return InkWell(
                  onTap: () {
                    controller.toggle();
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Rang.blue,
                  ),
                );
              })
            ],
          ),
        ),
      ),
    ],
  );
}

Expandd(context) {
  return SizedBox(

      ////main sizedbox
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.35,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              //header container

              height: MediaQuery.of(context).size.height / 15,
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'CORA’L',
                      style: TextStyle(color: Rang.blue),
                    ),
                    Builder(builder: (context) {
                      var controller =
                          ExpandableController.of(context, required: true)!;
                      return InkWell(
                        onTap: () {
                          controller.toggle();
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: Rang.blue,
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
            Container(

                //body container
                color: Rang.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          top: MediaQuery.of(context).size.height / 35),
                      child: const Text('Shop by Category',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          top: MediaQuery.of(context).size.height / 100),
                      child: const Text('Skincare',
                          style: TextStyle(color: Rang.greylight)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          top: MediaQuery.of(context).size.height / 100),
                      child: Text('Personal Care',
                          style: TextStyle(color: Rang.greylight)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          top: MediaQuery.of(context).size.height / 100),
                      child: Text('Handbags',
                          style: TextStyle(color: Rang.greylight)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          top: MediaQuery.of(context).size.height / 100),
                      child: Text('Apparels',
                          style: TextStyle(color: Rang.greylight)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          top: MediaQuery.of(context).size.height / 100),
                      child: Text('Watches',
                          style: TextStyle(color: Rang.greylight)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          top: MediaQuery.of(context).size.height / 100),
                      child: Text('Eye Wear',
                          style: TextStyle(color: Rang.greylight)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          top: MediaQuery.of(context).size.height / 100),
                      child: Text('Jewellery',
                          style: TextStyle(color: Rang.greylight)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Policy', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 35,
                          left: MediaQuery.of(context).size.width / 25),
                      child: SizedBox(
                        ///limit column

                        height: 50,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Return |',
                                    style: TextStyle(color: Rang.greylight)),
                                Text('Term of use |',
                                    style: TextStyle(color: Rang.greylight)),
                                Text('Sitemap |',
                                    style: TextStyle(color: Rang.greylight)),
                                Text('Security |',
                                    style: TextStyle(color: Rang.greylight)),
                                Text('Privacy |',
                                    style: TextStyle(color: Rang.greylight)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text('EPR Compliance |',
                                    style: TextStyle(color: Rang.greylight)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('About', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 25,
                          top: MediaQuery.of(context).size.height / 100),
                      child: Row(
                        children: const [
                          Text('Contact Us |',
                              style: TextStyle(color: Rang.greylight)),
                          Text('About Us |',
                              style: TextStyle(color: Rang.greylight)),
                          Text('Careers |',
                              style: TextStyle(color: Rang.greylight)),
                          Text('Press',
                              style: TextStyle(color: Rang.greylight)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width / 50),
                      child: Row(
                        children: [
                          Icon(
                            Icons.facebook,
                            color: Rang.tintBlue,
                            size: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width / 120,
                              left: MediaQuery.of(context).size.width / 120,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Rang.tintBlue,
                              size: 45,
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Rang.tintBlue,
                            size: 45,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width / 120,
                              left: MediaQuery.of(context).size.width / 120,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.youtube,
                              color: Rang.tintBlue,
                              size: 45,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 50,
                          top: MediaQuery.of(context).size.height / 120),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.place_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            'United State',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 30,
                          top: MediaQuery.of(context).size.height / 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('© 2021 | Cora Leviene All Rights Reserved',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 120,
                    )
                  ],
                )),
          ]));
}
