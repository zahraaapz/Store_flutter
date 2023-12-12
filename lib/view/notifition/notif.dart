import 'package:appstore/component/extention.dart';
import 'package:appstore/route_manager/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../constant/color.dart';
import '../../constant/storage.dart';
import '../../widget/ButtonWidgetRevesed.dart';
import '../../widget/iconANDtitle.dart';



class Notif extends StatelessWidget {
  const Notif({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  iconANDtitle('Notification',Icons.arrow_back_ios_new)
                ,
                  SizedBox(
                    width: MediaQuery.of(context).size.width /2.3,
                  ),
                  const Icon(
                    CupertinoIcons.ellipsis_vertical,
                    color: Rang.blue,
                  )
                ],
              ),
            
               (Dim.large/2).height,
              Image.asset('assets/image/notf.png'),
              (Dim.large).height,
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (Dim.large*2).width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Upto 50% OFF⚡⚡',style: textStyle.bodyMedium),
                       (Dim.large).height,
                       Text('This winter gift your loved ones.',style: textStyle.bodyMedium),
                               (Dim.large).height,
                              SizedBox(
                                width: Get.width/1.3,
                                child: ButtonWidgetRevesed(
                                  title:  'Shop now',
                                  onPressed: _onPressed,
                                ),
                              ),  ],
                  ),
                ],
              ),

              (Dim.large).height,
              Card(
                shadowColor: Colors.black,
                elevation: 1,
                color: Rang.toosi,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       (Dim.large/2).height,
                      Image.asset('assets/image/icon.png'),
                      Text('Share your feedback',style: textStyle.bodyMedium),
                     (Dim.large).height,
                      Text(style: textStyle.bodyMedium,
                        '''Hey, ${MyStorage.box.read(StorageNames.fullName)?? '--'}. Thanks for using CORAL. You know what? You can help us improve with just one click''',
                        textScaleFactor: 1.1,
                      )
                  , (Dim.large).height  ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
   _onPressed () {Get.offNamed(RouteNames.home);}}

