  import 'package:appstore/component/extention.dart';
import 'package:appstore/widget/firstscreenWidget/shoesSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../constant/color.dart';
import '../ButtonWidget.dart';

Future<dynamic> bottomSheetForSuggestList(
      _onPressed, select,controller,context, Size size, int index) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                ////bottomsheet container
                height: size.height / 2.2,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: size.width / 3,
                              height: size.height / 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: Image.asset(
                                        controller.suggestlist[index].ima!,
                                      ).image)),
                            ),
                            (Dim.xlarge/2).width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.suggestlist[index].brand!,
                                    style: textStyle.bodyMedium),
                                (Dim.xlarge/2).height,
                                Text(
                                  controller.suggestlist[index].name!,
                                  style: textStyle.bodyMedium,
                                ),
                                (Dim.xlarge/2).height,

                                Text('${controller.suggestlist[index].price}\$',
                                    style: textStyle.bodyMedium),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: size.width / 8,
                              height: size.height / 22,
                              decoration: BoxDecoration(
                                  color: Rang.toosi,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '4.5',
                                    style: textStyle.bodyMedium,
                                  ),
                                  const Icon(
                                    CupertinoIcons.star_fill,
                                    color: Rang.orange,
                                    size: 17,
                                  )
                                ],
                              ),
                            ),
                          

                             (Dim.large/2).width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Average Rating',
                                  style: textStyle.bodyMedium,
                                ),
                                (Dim.large/2).height,
                                Text(
                                  '43 Ratings & 23 Reviews',
                                  style: textStyle.bodyMedium,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      //////filter
                      controller.suggestlist[index].filter == 'shoes'
                          ? shoesSize(select)
                          :  (Dim.large+10).height,
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.qr_code_scanner,
                              color: Rang.blue,
                              size: 40,
                            ),
                          
                             (Dim.large).width,
                            ButtonWidget(
                              iconData: Icons.shopping_bag_outlined,
                              title: 'Add to Bags',
                              onPressed: () => _onPressed(index),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ); ////bottomsheet container
            },
          );
        }));
  }

