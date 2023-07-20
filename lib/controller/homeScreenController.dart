import 'package:appstore/getList/getlist.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/model/api.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxList<Kala> suggestlist = RxList();
  RxList<Kala> bag = RxList();
  RxList<Kala> jewellery = RxList();
  RxList<Kala> shoes = RxList();
  RxList<Kala> eyewear = RxList();
  RxList<Kala> watche = RxList();
  RxList<Kala> skincare = RxList();

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
    var response = await DioService().getList(ApiAddress().suggest);
if (suggestlist.isEmpty) {
   response.data.forEach((element) {
      suggestlist.add(Kala.fromJson(element));
    });
}
   
  }

  getHandBagItem() async {
    var response = await DioService().getList(ApiAddress().bag);
    if (bag.isEmpty) {
        response.data.forEach((element) {
      bag.add(Kala.fromJson(element));
    });
    }
    
  }

  getWatcheItem() async {
    var response = await DioService().getList(ApiAddress().watch);


  if (watche.isEmpty) {
  
      response.data.forEach((element) {
      watche.add(Kala.fromJson(element));
    }); 
    
   
  
 
  
  }}

  getjewellery() async {
    var response = await DioService().getList(ApiAddress().jewellery);
if (jewellery.isEmpty) {
    response.data.forEach((element) {
      jewellery.add(Kala.fromJson(element));
    });
}
  
  }

  getSkincareItem() async {
    var response = await DioService().getList(ApiAddress().skincare);
    if (skincare.isEmpty) {
        response.data.forEach((element) {
      skincare.add(Kala.fromJson(element));
    });
    }
  
  }

  getShoesItem() async {
    var response = await DioService().getList(ApiAddress().shoes);
    if (shoes.isEmpty) {
      
    
    response.data.forEach((element) {
      shoes.add(Kala.fromJson(element));
    });}
  }

  getEyewearItem() async {
    var response = await DioService().getList(ApiAddress().eyewear);
    if (eyewear.isEmpty) {
       response.data.forEach((element) {
      eyewear.add(Kala.fromJson(element));
    });
    }
   
  }
}
