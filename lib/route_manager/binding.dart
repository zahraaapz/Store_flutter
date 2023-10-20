import 'package:appstore/controller/homeScreenController.dart';
import 'package:get/get.dart';



class HomeScreenBinding implements Bindings{
  @override
  void dependencies() {

Get.put(HomeScreenController());

  }

}