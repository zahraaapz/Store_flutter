import 'dart:async';

import 'package:appstore/constant/color.dart';
import 'package:appstore/constant/widget/widget.dart';
import 'package:appstore/controller/homeScreenController.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../constant/text_style.dart';
import '../../route_manager/route_name.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Connectivity connectivity = Connectivity();
  bool onLine = false;




  void CHECK() async {

    var connectivityRESULT = await connectivity.checkConnectivity();
    setState(() {
      onLine = (connectivityRESULT == ConnectivityResult.mobile ||
          connectivityRESULT == ConnectivityResult.wifi);
      print(onLine.toString());
    });

    onLine 
        ? Get.offNamed(RouteNames.home)
        : checkNetwork();
        
  }

  Future<dynamic> checkNetwork() {
    return showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Container(
              height: Get.height / 4,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.signal_wifi_off,
                    color: Rang.blue,
                  ),
                  Text('Please check your connection',
                      style: textStyle.headlineSmall),
                      SizedBox(height: 20,),
            ButtonWidget(
              title: 'Check',
              iconData: Icons.refresh,
              onPressed: (){
                Navigator.pop(context);
                 CHECK();
                Get.find<HomeScreenController>().getHomeItem();
              },
            )   ],
              ),
            );
          },
        );
  }

  @override
  void initState() {
    super.initState();
    CHECK();
  }

  @override
  void dispose(){
    super.dispose();
 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Text(
                    'Wellcome...  ',
                    style: textStyle.headlineSmall,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SpinKitCircle(
                    color: Rang.blue,
                    size: 30,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
