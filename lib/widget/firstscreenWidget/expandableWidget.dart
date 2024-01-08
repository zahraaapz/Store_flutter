

import 'package:appstore/constant/color.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../model/model.dart';
import '../../component/text_style.dart';

class Expandablee extends StatelessWidget {
   Expandablee({super.key});

  @override
  Widget build(BuildContext context) {
      final size= MediaQuery.sizeOf(context);
    return ExpandableNotifier(
        child: ScrollOnExpand(
      child: Expandable(
        collapsed: collapse(context,size),
        expanded: expandd(context,size),
      ),
    ));
  }
}

collapse(context,size) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.all(size.width / 25),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: Colors.white,
          height: size.height / 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                'More about CORA’L',
                style: textStyle.displaySmall,
              ),
              Builder(builder: (context) {
                var controller =
                    ExpandableController.of(context, required: true)!;
                return IconButton(
                  onPressed: () {
                    controller.toggle();
                  },
                  icon: const Icon(
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

expandd(context,size) {
  return SizedBox(

      ////main sizedbox
      width: double.infinity,
      height: size.height / 1.35,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              //header container

              height: size.height / 15,
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: titleExpanded(),
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
                          left: size.height / 60,
                          top: size.height / 35),
                      child:  Text('Shop by Category',
                          style: textStyle.headlineLarge),
                    ),
                    SizedBox(
                      height:size.height /4.5 ,
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: expandableCat.length,
                      itemBuilder: (BuildContext context, int index) {

                        return   Padding(
                        padding: EdgeInsets.only(
                            left: size.height / 60,
                            top: size.height / 100),
                        child:  Text(expandableCat[index],
                                 style: textStyle.bodySmall,  )                      );
                        },
                    ),),
                 
                   
                  
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.height / 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Text('Policy', style: textStyle.headlineLarge),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.width / 35,
                          left: size.width / 25),
                      child: SizedBox(
                        ///limit column

                        height: 50,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text('Return |',
                                    style: textStyle.bodySmall),
                                Text('Term of use |',
                                     style: textStyle.bodySmall),
                                Text('Sitemap |',
                                   style: textStyle.bodySmall),
                                Text('Security |',
                                    style: textStyle.bodySmall),
                                Text('Privacy |',
                                   style: textStyle.bodySmall),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:  [
                                Text('EPR Compliance |',
                                  style: textStyle.bodySmall),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 100,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width / 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Text('About', style: textStyle.headlineLarge),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width / 25,
                          top: size.height / 100),
                      child: Row(
                        children: [
                          Text('Contact Us |',
                              style: textStyle.bodySmall),
                          Text('About Us |',
                              style: textStyle.bodySmall),
                          Text('Careers |',
                              style: textStyle.bodySmall),
                          Text('Press',
                              style: textStyle.bodySmall),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          size.width / 50),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.facebook,
                            color: Rang.tintBlue,
                            size: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: size.width / 120,
                              left: size.width / 120,
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Rang.tintBlue,
                              size: 45,
                            ),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Rang.tintBlue,
                            size: 45,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: size.width / 120,
                              left: size.width / 120,
                            ),
                            child: const FaIcon(
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
                          left: size.width / 50,
                          top: size.height / 120),
                      child:  Row(
                        children: [
                          const Icon(
                            Icons.place_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            'United State',
                            style: textStyle.headlineLarge
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width / 30,
                          top: size.height / 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Text('2021 | Cora Leviene All Rights Reserved',
                             style: textStyle.headlineLarge),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height / 140,
                    )
                  ],
                )),
          ]));
}

Row titleExpanded() {
  return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'CORA’L',
                    style: textStyle.bodySmall,
                  ),
                  Builder(builder: (context) {
                    var controller =
                        ExpandableController.of(context, required: true)!;
                    return IconButton(
                      onPressed: () {
                        controller.toggle();
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_up_outlined,
                        color: Rang.blue,
                      ),
                    );
                  })
                ],
              );
}
