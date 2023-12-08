import 'package:get/get.dart';

import '../../../controller/homeScreenController.dart';
import '../../../model/Model.dart';

String priceLists(
    int selectPage, HomeScreenController homeScreenController, int index) {
  return selectPage == 0
      ? homeScreenController.skincare[index].price!
      : selectPage == 1
          ? homeScreenController.watche[index].price!
          : selectPage == 2
              ? homeScreenController.bag[index].price!
              : selectPage == 3
                  ? homeScreenController.jewellery[index].price!
                  : selectPage == 4
                      ? homeScreenController.eyewear[index].price!
                      : homeScreenController.shoes[index].price!;
}



int lenghtLists(int selectPage, HomeScreenController homeScreenController) {
  return selectPage == 0
      ? homeScreenController.skincare.length
      : selectPage == 1
          ? homeScreenController.watche.length
          : selectPage == 2
              ? homeScreenController.bag.length
              : selectPage == 3
                  ? homeScreenController.jewellery.length
                  : selectPage == 4
                      ? homeScreenController.eyewear.length
                      : homeScreenController.shoes.length;
}


filterBrand(int selectPage, List<Product> filterList, List selectedBrand,
    HomeScreenController homeScreenController) {
  selectPage == 0
      ? filterList.assignAll(homeScreenController.skincare
          .where((p0) => selectedBrand.contains(p0.brand))
          .toList())
      : selectPage == 1
          ? filterList.assignAll(homeScreenController.watche
              .where((p0) => selectedBrand.contains(p0.brand))
              .toList())
          : selectPage == 2
              ? filterList.assignAll(homeScreenController.bag
                  .where((p0) => selectedBrand.contains(p0.brand))
                  .toList())
              : selectPage == 3
                  ? filterList.assignAll(homeScreenController.jewellery
                      .where((p0) => selectedBrand.contains(p0.brand))
                      .toList())
                  : selectPage == 4
                      ? filterList.assignAll(homeScreenController.eyewear
                          .where((p0) => selectedBrand.contains(p0.brand))
                          .toList())
                      : filterList.assignAll(homeScreenController.shoes
                          .where((p0) => selectedBrand.contains(p0.brand))
                          .toList());
}

RxList<Product> selectList(int selectPage, HomeScreenController homeScreenController) {
    return selectPage == 0
                              ? homeScreenController.skincare
                              : selectPage == 1
                                  ? homeScreenController.watche
                                  : selectPage == 2
                                      ? homeScreenController.bag
                                      : selectPage == 3
                                          ? homeScreenController.jewellery
                                          : selectPage == 4
                                              ? homeScreenController.eyewear
                                              : homeScreenController.shoes;
  }

sortLisLowtoHigh(int selectPage, HomeScreenController homeScreenController) {
  selectPage == 0
      ? homeScreenController.skincare.sort(((a, b) => double.parse(a.price!)
          .toString()
          .compareTo(double.parse(b.price!).toString())))
      : selectPage == 1
          ? homeScreenController.watche.sort(((a, b) => double.parse(a.price!)
              .toString()
              .compareTo(double.parse(b.price!).toString())))
          : selectPage == 2
              ? homeScreenController.bag.sort(((a, b) => double.parse(a.price!)
                  .toString()
                  .compareTo(double.parse(b.price!).toString())))
              : selectPage == 3
                  ? homeScreenController.jewellery.sort(((a, b) =>
                      double.parse(a.price!)
                          .toString()
                          .compareTo(double.parse(b.price!).toString())))
                  : selectPage == 4
                      ? homeScreenController.eyewear.sort(
                          ((a, b) => double.parse(a.price!).toString().compareTo(double.parse(b.price!).toString())))
                      : homeScreenController.shoes.sort(((a, b) => double.parse(a.price!).toString().compareTo(double.parse(b.price!).toString())));
}

sortListHightoLow(int selectPage, HomeScreenController homeScreenController) {
  selectPage == 0
      ? homeScreenController.skincare.sort(((b, a) => double.parse(a.price!)
          .toString()
          .compareTo(double.parse(b.price!).toString())))
      : selectPage == 1
          ? homeScreenController.watche.sort(((b, a) => double.parse(a.price!)
              .toString()
              .compareTo(double.parse(b.price!).toString())))
          : selectPage == 2
              ? homeScreenController.bag.sort(((b, a) => double.parse(a.price!)
                  .toString()
                  .compareTo(double.parse(b.price!).toString())))
              : selectPage == 3
                  ? homeScreenController.jewellery.sort(((b, a) =>
                      double.parse(a.price!)
                          .toString()
                          .compareTo(double.parse(b.price!).toString())))
                  : selectPage == 4
                      ? homeScreenController.eyewear.sort(
                          ((b, a) => double.parse(a.price!).toString().compareTo(double.parse(b.price!).toString())))
                      : homeScreenController.shoes.sort(((b, a) => double.parse(a.price!).toString().compareTo(double.parse(b.price!).toString())));
}

String brandItem(
    int selectPage, int index, HomeScreenController homeScreenController) {
  return selectPage == 0
      ? homeScreenController.skincare[index].brand!
      : selectPage == 1
          ? homeScreenController.watche[index].brand!
          : selectPage == 2
              ? homeScreenController.bag[index].brand!
              : selectPage == 3
                  ? homeScreenController.jewellery[index].brand!
                  : selectPage == 4
                      ? homeScreenController.eyewear[index].brand!
                      : homeScreenController.shoes[index].brand!;
}

String nameItem(
    int selectPage, int index, HomeScreenController homeScreenController) {
  return selectPage == 0
      ? homeScreenController.skincare[index].name!
      : selectPage == 1
          ? homeScreenController.watche[index].name!
          : selectPage == 2
              ? homeScreenController.bag[index].name!
              : selectPage == 3
                  ? homeScreenController.jewellery[index].name!
                  : selectPage == 4
                      ? homeScreenController.eyewear[index].name!
                      : homeScreenController.shoes[index].name!;
}

String imaItem(
    int selectPage, int index, HomeScreenController homeScreenController) {
  return selectPage == 0
      ? homeScreenController.skincare[index].ima!
      : selectPage == 1
          ? homeScreenController.watche[index].ima!
          : selectPage == 2
              ? homeScreenController.bag[index].ima!
              : selectPage == 3
                  ? homeScreenController.jewellery[index].ima!
                  : selectPage == 4
                      ? homeScreenController.eyewear[index].ima!
                      : homeScreenController.shoes[index].ima!;
}