

import 'package:appstore/route_manager/binding.dart';
import 'package:appstore/route_manager/route.dart';
import 'package:appstore/route_manager/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
      await GetStorage.init();
  runApp(const AppStore());
}

class AppStore extends StatelessWidget {
  const AppStore({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       getPages: RoutePage.routePage,
       initialRoute:RouteNames.root ,
       initialBinding: HomeScreenBinding(),
       
       );
  }
}
