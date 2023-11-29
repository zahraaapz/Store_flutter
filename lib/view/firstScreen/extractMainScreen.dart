import 'dart:async';
import 'package:appstore/model/Model.dart';
import 'package:appstore/constant/color.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../component/text_style.dart';
import '../../controller/homeScreenController.dart';
import '../../widget/ButtonWidget.dart';
import '../../widget/firstscreenWidget/expandableWidget.dart';
import '../../widget/firstscreenWidget/Banner.dart';
import '../../widget/firstscreenWidget/Brand.dart';
import '../../widget/firstscreenWidget/CollectionList.dart';
import '../../widget/firstscreenWidget/Drawer.dart';
import '../../widget/firstscreenWidget/Shortcut.dart';
import '../../widget/firstscreenWidget/appBar.dart';
import '../../widget/firstscreenWidget/shoesSize.dart';
import '../../widget/firstscreenWidget/typeList.dart';
import '../../widget/shimmerList.dart';

class Extractmainscreen extends StatefulWidget {
  const Extractmainscreen({super.key});

  @override
  State<Extractmainscreen> createState() => _ExtractmainscreenState();
}

class _ExtractmainscreenState extends State<Extractmainscreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  RxInt select = 0.obs;
  var controller = Get.find<HomeScreenController>();
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      controller.suggestlist.isEmpty ? controller.onInit() : timer.cancel();
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
          key: _key,
          backgroundColor: Colors.white,
          drawer: drawer(size),
          body: Stack(children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(children: [
                ////App Bar
                appBar(size, context, _key),

                ///Bannner
                const Baner(),

                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Top Categories', style: textStyle.headlineMedium),
                    ],
                  ),
                ),
                ////type list
                typeList(size,select),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('New Arrivals', style: textStyle.headlineMedium),
                        SizedBox(
                            child: Row(
                          children: [
                            Text(
                              'View all',
                              style: textStyle.bodyMedium,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Rang.blue,
                              size: 15,
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                //////suggest List
                const SizedBox(
                  height: 5,
                ),
                Obx(() => controller.suggestlist.isNotEmpty
                    ? suggList(size)
                    : ShimmerSuggestList(size: size)),

                Container(
                  ///collection container
                  color: Rang.blue,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Handpicked Collections',
                                  style: textStyle.headlineLarge),
                            ],
                          ),
                        ),
                        CollectionList(
                          size: size,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shop by Brands',
                        style: textStyle.headlineMedium,
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              'View all',
                              style: textStyle.bodyMedium,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Rang.blue,
                              size: 15,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Brand(
                        size: size,
                      ),
                    ],
                  ),
                ),
                Shortcut(size: size),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 8, top: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Makeup & Skincare',
                            style: textStyle.headlineMedium)
                      ]),
                ),
                Container(
                  width: size.width / 1.12,
                  height: size.height / 5.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('assets/image/banner/makeup.png')
                              .image)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 8),
                  child: Row(children: [
                    Container(
                      width: size.width / 2.3,
                      height: size.height / 5.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                      'assets/image/banner/skincare.png')
                                  .image)),
                    ),
                    Container(
                      width: size.width / 2.2,
                      height: size.height / 5.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                      'assets/image/banner/facepacks.png')
                                  .image)),
                    )
                  ]),
                ),
                Expandablee(),

                ///expandble box
                const SizedBox(
                  height: 30,
                )
              ]),
            ),
          ])),
    );
  }

  suggList(Size size) {
    //suggestion List
    return SizedBox(
      height: size.height / 4.3,
      width: double.infinity,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: controller.suggestlist.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                bottomSheetForSuggestList(context, size, index);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height / 9,
                      width: size.width / 3.5,
                      ////container suggestlist
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                controller.suggestlist[index].ima!,
                              ).image)),
                    ),
                    SizedBox(
                      width: size.width / 3.5,
                      height: size.height / 19,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.suggestlist[index].name!,
                              style: textStyle.bodyMedium),
                        ],
                      ),
                    ),
                    Text(controller.suggestlist[index].brand!,
                        style: textStyle.bodyMedium),
                    const SizedBox(
                      height: 6,
                    ),
                    Text("${controller.suggestlist[index].price}\$",
                        style: textStyle.bodyMedium),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future<dynamic> bottomSheetForSuggestList(
      BuildContext context, Size size, int index) {
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
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.suggestlist[index].brand!,
                                    style: textStyle.bodyMedium),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  controller.suggestlist[index].name!,
                                  style: textStyle.bodyMedium,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
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
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Average Rating',
                                  style: textStyle.bodyMedium,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
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
                          : const SizedBox(
                              height: 30,
                            ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.qr_code_scanner,
                              color: Rang.blue,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
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



  _onPressed(int index) {
    if (!myBagList.contains(controller.suggestlist[index])) {
      myBagList.add(controller.suggestlist[index]);
    }
  }
}
