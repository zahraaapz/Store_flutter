import 'package:appstore/view/firstScreen/mainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/color/color.dart';
import '../../constant/widget/component.dart';
import '../profile/personal_info.dart';

class Notif extends StatelessWidget {
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
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Rang.blue,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                   Text(
                    'Notification',style: textStyle.displaySmall,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  const Icon(
                    CupertinoIcons.ellipsis_vertical,
                    color: Rang.blue,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset('assets/image/notf.png'),
              const SizedBox(
                height: 20,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 36,
                  ),
                  SizedBox(
                    width: 320,
                    height: 200,
                   
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Upto 50% OFF⚡⚡',style: textStyle.bodyMedium),
                        const SizedBox(
                          height: 20,
                        ),
                         Text('This winter gift your loved ones.',style: textStyle.bodyMedium),
                                  const SizedBox(
                                  height: 20,
                                ),
                                ButtonWidgetRevesed(
                                  title:  'Shop now',
                                  onPressed: _onPressed,
                                ),  ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Card(
                shadowColor: Colors.black,
                elevation: 1,
                color: Rang.toosi,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        SizedBox(
                        height: 10,
                      ),
                      Image.asset('assets/image/icon.png'),
                      Text('Share your feedback',style: textStyle.bodyMedium),
                      SizedBox(
                        height: 20,
                      ),
                      Text(style: textStyle.bodyMedium,
                        '''Hey, ${Personal().box.read('fullName')??'--'}. Thanks for using CORAL. You know what? You can help us improve with just one click''',
                        textScaleFactor: 1.1,
                      )
                  ,SizedBox(height: 10,)  ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
   _onPressed () {Get.to(Home());}}

