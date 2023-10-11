

import 'package:appstore/getList/getlist.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/constant/api/api.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxList<Kala> suggestlist = RxList();
  RxList<Kala> bag = RxList();
  RxList<Kala> jewellery = RxList();
  RxList<Kala> shoes = RxList();
  RxList<Kala> eyewear = RxList();
  RxList<Kala> watche = RxList();
  RxList<Kala> skincare = RxList();
  RxList<Kala> searchKala = RxList();
  RxBool waiting=false.obs;
  @override
  void onInit() {
    super.onInit();
    getHomeItem();
    getShoesItem();
    getHandBagItem();
    getjewellery();
    getSkincareItem();
    getWatcheItem();
    getEyewearItem();
  }



  getHomeItem() async {
    waiting.value=true;

    var response = await DioService().getList(ApiAddress().suggest);
    print(response.statusCode+'LLLL');
if (suggestlist.isEmpty) {
   response.data.forEach((element) {
      suggestlist.add(Kala.fromJson(element));
    });

  
}

     waiting.value=false;
  }

  getHandBagItem() async {
     waiting.value=true;
    var response = await DioService().getList(ApiAddress().bag);
    if (bag.isEmpty) {
        response.data.forEach((element) {
      bag.add(Kala.fromJson(element));
    });
   searchKala.addAll(bag); }
     waiting.value=false;
  }

  getWatcheItem() async {
     waiting.value=true;
    var response = await DioService().getList(ApiAddress().watch);


  if (watche.isEmpty) {
  
      response.data.forEach((element) {
      watche.add(Kala.fromJson(element));
    }); 
    
   searchKala.addAll(watche);
  
  
  
  }waiting.value=false;}

  getjewellery() async {
     waiting.value=true;
    var response = await DioService().getList(ApiAddress().jewellery);
if (jewellery.isEmpty) {
    response.data.forEach((element) {
      jewellery.add(Kala.fromJson(element));
    });

    searchKala.addAll(jewellery);
}
   waiting.value=false;
  }

  getSkincareItem() async {
    waiting.value=true;
    var response = await DioService().getList(ApiAddress().skincare);
    if (skincare.isEmpty) {
        response.data.forEach((element) {
      skincare.add(Kala.fromJson(element));
    });
   searchKala.addAll(skincare); }
  waiting.value=false;
  }

  getShoesItem() async {
    waiting.value=true;
    var response = await DioService().getList(ApiAddress().shoes);
    if (shoes.isEmpty) {
      
    
    response.data.forEach((element) {
      shoes.add(Kala.fromJson(element));
    });
    searchKala.addAll(shoes);}
    waiting.value=false;
  }

  getEyewearItem() async {
    waiting.value=true;
    var response = await DioService().getList(ApiAddress().eyewear);
    if (eyewear.isEmpty) {
       response.data.forEach((element) {
      eyewear.add(Kala.fromJson(element));
    });
   searchKala.addAll(eyewear); }
  waiting.value=false;
  }


}
