import 'dart:async';
import 'package:appstore/component/extention.dart';
import 'package:appstore/constant/color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../controller/homeScreenController.dart';
import '../../widget/firstscreenWidget/expandableWidget.dart';
import '../../widget/firstscreenWidget/Banner.dart';
import '../../widget/firstscreenWidget/Brand.dart';
import '../../widget/firstscreenWidget/CollectionList.dart';
import '../../widget/firstscreenWidget/Drawer.dart';
import '../../widget/firstscreenWidget/Shortcut.dart';
import '../../widget/firstscreenWidget/appBar.dart';
import '../../widget/firstscreenWidget/suggestList.dart';
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

              
               (Dim.small).width,

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

                  (Dim.large/4).height,

                Obx(() => controller.suggestlist.isNotEmpty
                    ? SuggList(controller: controller,size: size,select: select,)
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
             (Dim.large+10).height,

              ]),
            ),
          ])),
    );
  }






}
