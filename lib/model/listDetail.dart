import 'package:appstore/model/Model.dart';
import 'package:get/get.dart';

import '../controller/homeScreenController.dart';

class ListDetail {

 var homeScreenController=Get.put(HomeScreenController());
  static var skincareLenght;
  static var WatchesLenght;
  static var handBagLenght;
  static var jewelleryLenght;
  static var shoesLenght;
  static var eyewearLenght;

  static var skincareName;
  static var WatchesName;
  static var handBagName;
  static var jewellerName;
  static var shoesName;
  static var eyewearName;

init(){
    skincareLenght=homeScreenController.skincare.length;
    WatchesLenght=homeScreenController.watche.length;
    handBagLenght=homeScreenController.bag.length;
    jewelleryLenght=homeScreenController.jewellery.length;
    eyewearLenght=homeScreenController.eyewear.length;
    shoesLenght=homeScreenController.shoes.length;

   skincareName=homeScreenController.skincare;
   WatchesName=homeScreenController.watche;
   handBagName=homeScreenController.bag;
   jewellerName=homeScreenController.jewellery;
   shoesName=homeScreenController.eyewear;
   eyewearName=homeScreenController.shoes;

}
 int LenghtLists(int selectPage){
   return selectPage == 0
        ?skincareLenght
        : selectPage == 1
            ?WatchesLenght 
            : selectPage == 2
                ? handBagLenght
                : selectPage == 3
                    ? jewelleryLenght
                    : selectPage == 4
                        ? eyewearLenght
                        : shoesLenght;
} 

String brandItem(int selectPage,int index){
   return selectPage == 0
                                              ? homeScreenController
                                                  .skincare[index].brand!
                                              : selectPage == 1
                                                  ? homeScreenController
                                                      .watche[index].brand!
                                                  : selectPage == 2
                                                      ? homeScreenController
                                                          .bag[index].brand!
                                                      : selectPage == 3
                                                          ? homeScreenController
                                                              .jewellery[index]
                                                              .brand!
                                                          : selectPage == 4
                                                              ? homeScreenController
                                                                  .eyewear[
                                                                      index]
                                                                  .brand!
                                                              : homeScreenController
                                                                  .shoes[index]
                                                                  .brand!;
}


sortLisLowtoHigh(int selectPage){
     selectPage == 0
                                              ? homeScreenController.skincare.sort(
                                                  ((a, b) => double.parse(a.price!)
                                                      .toString()
                                                      .compareTo(double.parse(b.price!)
                                                          .toString())))
                                              : selectPage == 1
                                                  ? homeScreenController.watche.sort(
                                                      ((a, b) => double.parse(a.price!)
                                                          .toString()
                                                          .compareTo(double.parse(b.price!)
                                                              .toString())))
                                                  : selectPage == 2
                                                      ? homeScreenController.bag
                                                          .sort(((a, b) => double.parse(a.price!).toString().compareTo(double.parse(b.price!).toString())))
                                                      : selectPage == 3
                                                          ? homeScreenController.jewellery.sort(((a, b) => double.parse(a.price!).toString().compareTo(double.parse(b.price!).toString())))
                                                          : selectPage == 4
                                                              ? homeScreenController.eyewear.sort(((a, b) => double.parse(a.price!).toString().compareTo(double.parse(b.price!).toString())))
                                                              : homeScreenController.shoes.sort(((a, b) => double.parse(a.price!).toString().compareTo(double.parse(b.price!).toString())));
}

filterBrand(int selectPage,List<Kala>filterList,List selectedBrand){

selectPage==0?    
 filterList.assignAll(                                            
        homeScreenController.skincare.where((p0) =>selectedBrand.contains(p0.brand)).toList() ):
    selectPage==1?
 filterList.assignAll(                                            
   homeScreenController.watche.where((p0) =>selectedBrand.contains(p0.brand)).toList()
    ):     selectPage==2?
 filterList.assignAll(                                            
   homeScreenController.bag.where((p0) =>selectedBrand.contains(p0.brand)).toList()
    ):     selectPage==3?
 filterList.assignAll(                                            
   homeScreenController.jewellery.where((p0) =>selectedBrand.contains(p0.brand)).toList()
    ):      selectPage==4?
 filterList.assignAll(                                            
   homeScreenController.eyewear.where((p0) =>selectedBrand.contains(p0.brand)).toList()
    ):    
 filterList.assignAll(                                            
   homeScreenController.shoes.where((p0) =>selectedBrand.contains(p0.brand)).toList()
    );  




}

sortListHightoLow(int selectPage){

 selectPage == 0
                                            ? homeScreenController.skincare.sort(
                                                ((b, a) => double.parse(a.price!)
                                                    .toString()
                                                    .compareTo(double.parse(b.price!)
                                                        .toString())))
                                            : selectPage == 1
                                                ? homeScreenController.watche.sort(
                                                    ((b, a) => double.parse(a.price!)
                                                        .toString()
                                                        .compareTo(double.parse(b.price!)
                                                            .toString())))
                                                : selectPage == 2
                                                    ? homeScreenController.bag
                                                        .sort(((b, a) => double.parse(a.price!).toString().compareTo(double.parse(b.price!).toString())))
                                                    : selectPage == 3
                                                        ? homeScreenController.jewellery.sort(((b, a) => double.parse(a.price!).toString().compareTo(double.parse(b.price!).toString())))
                                                        : selectPage == 4
                                                            ? homeScreenController.eyewear.sort(((b, a) => double.parse(a.price!).toString().compareTo(double.parse(b.price!).toString())))
                                                            : homeScreenController.shoes.sort(((b, a) => double.parse(a.price!).toString().compareTo(double.parse(b.price!).toString())));



}
}