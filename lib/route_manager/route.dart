

import 'package:appstore/route_manager/binding.dart';
import 'package:appstore/route_manager/route_name.dart';
import 'package:appstore/view/Register/register.dart';
import 'package:appstore/view/Register/signup.dart';
import 'package:appstore/view/address/address.dart';
import 'package:appstore/view/firstScreen/mainScreen.dart';
import 'package:appstore/view/notifition/notif.dart';
import 'package:appstore/view/payment/payment.dart';
import 'package:appstore/view/profile/personal_info.dart';
import 'package:appstore/view/review/review.dart';
import 'package:appstore/view/search/search.dart';
import 'package:appstore/view/search/searchResult.dart';
import 'package:get/get.dart';

import '../view/splash/splash-screen.dart';
import '../view/wish/wishlist.dart';

abstract class RoutePage{

 static List<GetPage<dynamic>>routePage=[
  GetPage(name: RouteNames.home, page: ()=>Home(),binding:HomeScreenBinding()),
  GetPage(name: RouteNames.register, page: ()=>const RegisterScreen()),
  GetPage(name: RouteNames.address, page: ()=>Address()),
  GetPage(name: RouteNames.signup, page: ()=>const SignupScreen()),
  GetPage(name: RouteNames.search, page: ()=>Search(),binding:HomeScreenBinding()),
  GetPage(name: RouteNames.searchResult, page: ()=>const SearchResult()),
  GetPage(name: RouteNames.notifition, page: ()=>const Notif()),
  GetPage(name: RouteNames.payment, page: ()=>const Payments()),
  GetPage(name: RouteNames.review, page: ()=> Review()),
  GetPage(name: RouteNames.root, page: ()=> const Splash()),
  GetPage(name: RouteNames.wish, page: ()=> const Wish()),
  GetPage(name: RouteNames.personal, page: ()=> Personal()),
];











}