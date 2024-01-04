import 'dart:async';
import 'package:appstore/component/extention.dart';
import 'package:appstore/constant/color.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../constant/storage.dart';
import '../../route_manager/route_name.dart';
import '../../widget/ButtonWidget.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Connectivity connectivity = Connectivity();
  bool onLine = false;

  void check() async {
    var connectivityResult = await connectivity.checkConnectivity();
    setState(() {
      onLine = (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi);
    });

    if (onLine == false) {
      checkNetwork();
    }
    if (onLine == true && MyStorage().checkAuthCondition()) {
      Get.offNamed(RouteNames.signup);
     
    }
    if (onLine == true && !MyStorage().checkAuthCondition()) {
      Get.offNamed(RouteNames.home);
      print(MyStorage.box.read(StorageNames.userName).toString());
    }
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
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.signal_wifi_off,
                color: Rang.blue,
              ),
              Text('Please check your connection',
                  style: textStyle.headlineSmall),
              (Dim.large).height,
              ButtonWidget(
                title: 'Check',
                iconData: Icons.refresh,
                onPressed: () {
                  Navigator.pop(context);
                  check();
                  // Get.find<HomeScreenController>().getLists();
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    check();
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
                  (Dim.large * 2).height,
                  const SpinKitCircle(
                    color: Rang.blue,
                    size: 40,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
