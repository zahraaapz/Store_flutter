



import 'package:appstore/model/Model.dart';
import 'package:appstore/constant/api.dart';
import 'package:get/get.dart';
import '../service/service.dart';

class HomeScreenController extends GetxController {
  RxList<Product> suggestlist = RxList();
  RxList<Product> bag = RxList();
  RxList<Product> jewellery = RxList();
  RxList<Product> shoes = RxList();
  RxList<Product> eyewear = RxList();
  RxList<Product> watche = RxList();
  RxList<Product> skincare = RxList();
  RxList<Product> searchKala = RxList();
  RxBool waiting=false.obs;
 


  @override
  void onInit() {
    
    super.onInit();
    
   getLists();
    
  }
getLists(){

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

if (suggestlist.isEmpty) {
   response.data.forEach((element) {
      suggestlist.add(Product.fromJson(element));
    });

  
}

     waiting.value=false;
  }

  getHandBagItem() async {
     waiting.value=true;
    var response = await DioService().getList(ApiAddress().bag);
    if (bag.isEmpty) {
        response.data.forEach((element) {
      bag.add(Product.fromJson(element));
    });
   searchKala.addAll(bag); }
     waiting.value=false;
  }

  getWatcheItem() async {
     waiting.value=true;
    var response = await DioService().getList(ApiAddress().watch);


  if (watche.isEmpty) {
  
      response.data.forEach((element) {
      watche.add(Product.fromJson(element));
    }); 
    
   searchKala.addAll(watche);
  
  
  
  }waiting.value=false;}

  getjewellery() async {
     waiting.value=true;
    var response = await DioService().getList(ApiAddress().jewellery);
if (jewellery.isEmpty) {
    response.data.forEach((element) {
      jewellery.add(Product.fromJson(element));
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
      skincare.add(Product.fromJson(element));
    });
   searchKala.addAll(skincare); }
  waiting.value=false;
  }

  getShoesItem() async {
    waiting.value=true;
    var response = await DioService().getList(ApiAddress().shoes);
    if (shoes.isEmpty) {
      
    
    response.data.forEach((element) {
      shoes.add(Product.fromJson(element));
    });
    searchKala.addAll(shoes);}
    waiting.value=false;
  }

  getEyewearItem() async {
    waiting.value=true;
    var response = await DioService().getList(ApiAddress().eyewear);
    if (eyewear.isEmpty) {
       response.data.forEach((element) {
      eyewear.add(Product.fromJson(element));
    });
   searchKala.addAll(eyewear); }
  waiting.value=false;
  }


}
