// ignore_for_file: must_be_immutable

import 'package:appstore/component/extention.dart';
import 'package:appstore/constant/color.dart';
import 'package:appstore/controller/homeScreenController.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/view/firstScreen/mainScreen.dart';
import 'package:appstore/view/selectType/detail_kala.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../widget/shimmerList.dart';

class Selectkala extends StatefulWidget {
  int select;

  Selectkala(this.select, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<Selectkala> createState() => _SelectkalaState(select);
}

class _SelectkalaState extends State<Selectkala> {
  //for showing by filter,....//
  RxInt level = 0.obs;

  //filter
 late List<bool> checkBoxBrands;
  String ?selectedRadioTile;
  RxList<Product> filterPrice = RxList();
  RxList<Product> filterListBrand = RxList();
  List<bool> checkBoxPriceBrand = [false, false];
  List selectedBrand = [];
  //
  int selectPage;
   int ?lenght;
  var homeScreenController= Get.find<HomeScreenController>();


 late List brands;
 late List<double> prices;

  //for limit price
 late RangeValues val;

  _SelectkalaState(
    this.selectPage,
  );


showlist(){
  setState(() {
        lenght = lenghtLists(selectPage, homeScreenController);

    checkBoxBrands = List.generate(lenght!, (index) => false);
    brands = List.generate(
        lenght!, (index) => brandItem(selectPage, index, homeScreenController));

    prices = List.generate(
        lenght!,
        (index) => double.parse(
            priceLists(selectPage, homeScreenController, index).toString()));
    prices.sort();
    val = RangeValues(
      prices.first,
      prices.last,
    );
  });


  
}

  Future<void> showMyDialog() async {
    return showDialog<void>(
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, setState) => Dialog(
                child: SizedBox(
                  height: Get.height/2.5,
                  child: Column(children: [
                    SizedBox(
                      height: Get.height / 1.9,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: brands.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) =>
                            CheckboxListTile(
                          title: Text(
                            brands[index],
                            style: textStyle.headlineMedium,
                          ),
                          fillColor: MaterialStateProperty.all(Rang.blue),
                          onChanged: (bool? value) {
                            level.value = 0;
                            setState(
                              () {
                                checkBoxBrands[index] = value!;

                                if (checkBoxBrands[index] == true) {
                                  selectedBrand.add(brands[index]);

                                  filterBrand(selectPage, filterListBrand,
                                      selectedBrand, homeScreenController);
                                  level.value = 1;
                                } else {
                                  filterListBrand.removeWhere(
                                      (e) => brands[index] == e.brand);
                                  selectedBrand.remove(brands[index]);

                                  filterListBrand.isEmpty
                                      ? level.value = 0
                                      : level.value = 1;
                                }
                              },
                            );
                          },
                          value: checkBoxBrands[index],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
        child: WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(children: [
          Obx(
            () => Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                  
                    (Dim.medium+3).width,
                    InkWell(
                      onTap: () {
                        Get.offAll(Home());
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Rang.blue,
                        ),
                      ),
                    ),
                     (Dim.xlarge).width,
                    Text(
                      selectPage == 0
                          ? 'Skincare'
                          : selectPage == 1
                              ? 'Watches'
                              : selectPage == 2
                                  ? 'Handbags'
                                  : selectPage == 3
                                      ? 'jewellery'
                                      : selectPage == 4
                                          ? 'Eyewear'
                                          : 'Shoes',
                      style: textStyle.headlineSmall,
                    )
                  ],
                ),
              ),
              homeScreenController.bag.isNotEmpty
                  ? mainList(level.value == 2
                      ? filterPrice
                      : level.value == 1
                          ? filterListBrand
                          : selectPage == 0
                              ? homeScreenController.skincare
                              : selectPage == 1
                                  ? homeScreenController.watche
                                  : selectPage == 2
                                      ? homeScreenController.bag
                                      : selectPage == 3
                                          ? homeScreenController.jewellery
                                          : selectPage == 4
                                              ? homeScreenController.eyewear
                                              : homeScreenController.shoes)
                  : const ShimmerList(),
            ]),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                        homeScreenController.suggestlist.isEmpty?null:
                       filterBrandOrPrice(context);
                      showlist();
                    },
                    child: const Icon(Icons.filter_alt_outlined)),
                InkWell(
                  onTap: (() {
                    homeScreenController.suggestlist.isEmpty?null:
                    filterBySort(context);
                   showlist();
                  }),
                  child: const Icon(Icons.sort_rounded),
                ),
              ],
            ),
          )
        ]),
      ),
    ));
  }

  Future<dynamic> filterBySort(BuildContext context) {
    return showModalBottomSheet(
        //bottomsheetfilter
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) {
          return StatefulBuilder(
            builder: (context, setState) => Container(
              height: Get.height / 3.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25, bottom: 8, top: 15),
                      child: Text(
                        'Sort by',
                        style: TextStyle(
                            fontFamily: 'Auliare',
                            color: Rang.greylight,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(
                      color: Rang.grey,
                      indent: 40,
                      endIndent: 40,
                      height: 1.5,
                    ),
                    RadioListTile(
                      activeColor: Rang.blue,
                      title: Text('Price - Hight to Low',
                          style: textStyle.bodyMedium),
                      groupValue: selectedRadioTile,
                      value: '0',
                      onChanged: (value) {
                        level.value = 0;
                        setState(() {
                          selectedRadioTile = value.toString();
                          sortListHightoLow(selectPage, homeScreenController);
                        });
                      },
                    ),
                    const Divider(
                      color: Rang.grey,
                      indent: 40,
                      endIndent: 40,
                      height: 1.5,
                    ),
                    RadioListTile(
                        activeColor: Rang.blue,
                        title: Text('Price - Low to Hight',
                            style: textStyle.bodyMedium),
                        groupValue: selectedRadioTile,
                        value: '1',
                        onChanged: (value) {
                          level.value = 0;
                          setState(() {
                            selectedRadioTile = value.toString();
                            sortLisLowtoHigh(selectPage, homeScreenController);
                          });
                        }),
                    const Divider(
                      color: Rang.grey,
                      indent: 40,
                      endIndent: 40,
                      height: 1.5,
                    ),
                    RadioListTile(
                      activeColor: Rang.blue,
                      title:
                          Text('Lasted product', style: textStyle.bodyMedium),
                      groupValue: selectedRadioTile,
                      value: '2',
                      onChanged: (value) {
                        setState(() {
                          selectedRadioTile = value.toString();
                        });
                      },
                    ),
                  ]),
            ),
          );
        }));
  }

  Future<dynamic> filterBrandOrPrice(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return StatefulBuilder(
              builder: (context, setState) => Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white,
                    ),
                    height: Get.height / 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Filter by',
                            style: TextStyle(
                                fontFamily: 'Auliare',
                                color: Rang.greylight,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(
                          color: Rang.grey,
                          indent: 20,
                          endIndent: 30,
                          height: 1.5,
                        ),
                        CheckboxListTile(
                            title: Text(
                              'Brand',
                              style: textStyle.headlineMedium,
                            ),
                            fillColor: MaterialStateProperty.all(Rang.blue),
                            value: checkBoxPriceBrand[0],
                            onChanged: (value) {
                              setState(() {
                                checkBoxPriceBrand[0] = value!;
                              });

                              checkBoxPriceBrand[0] == true
                                  ? showMyDialog()
                                  : null;
                            }),
                        CheckboxListTile(
                            title: Text(
                              'Price',
                              style: textStyle.headlineMedium,
                            ),
                            fillColor: MaterialStateProperty.all(Rang.blue),
                            value: checkBoxPriceBrand[1],
                            onChanged: (value) {
                              setState(() {
                                checkBoxPriceBrand[1] = value!;
                              });
                              checkBoxPriceBrand[1] == true
                                  ? bottomSheetLimitedPrice(context)
                                  : null;
                            }),
                      ],
                    ),
                  ));
        }));
  }

  Future<dynamic> bottomSheetLimitedPrice(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, setState) => Container(
                height: Get.height / 3.7,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Rang.blue,
                        inactiveTrackColor: Rang.greylight,
                        thumbColor: Rang.blue,
                      ),
                      child: RangeSlider(
                        labels: RangeLabels(
                            val.start.toString(), val.end.toString()),
                        min: prices.first,
                        max: prices.last,
                        divisions: 15,
                        onChanged: (value) {
                          level.value = 0;
                          setState(
                            () {
                              val = value;

                              switch (selectPage) {
                                case 0:
                                  filterPrice.assignAll(homeScreenController
                                      .skincare
                                      .where((element) =>
                                          double.tryParse(
                                                  element.price.toString())! >=
                                              val.start &&
                                          double.tryParse(
                                                  element.price.toString())! <=
                                              val.end));
                                  break;
                                case 1:
                                  filterPrice.assignAll(homeScreenController
                                      .watche
                                      .where((element) =>
                                          double.tryParse(
                                                  element.price.toString())! >=
                                              val.start &&
                                          double.tryParse(
                                                  element.price.toString())! <=
                                              val.end));
                                  break;
                                case 2:
                                  filterPrice.assignAll(homeScreenController.bag
                                      .where((element) =>
                                          double.tryParse(
                                                  element.price.toString())! >=
                                              val.start &&
                                          double.tryParse(
                                                  element.price.toString())! <=
                                              val.end));
                                  break;
                                case 3:
                                  filterPrice.assignAll(homeScreenController
                                      .jewellery
                                      .where((element) =>
                                          double.tryParse(
                                                  element.price.toString())! >=
                                              val.start &&
                                          double.tryParse(
                                                  element.price.toString())! <=
                                              val.end));
                                  break;
                                case 4:
                                  filterPrice.assignAll(homeScreenController
                                      .eyewear
                                      .where((element) =>
                                          double.tryParse(
                                                  element.price.toString())! >=
                                              val.start &&
                                          double.tryParse(
                                                  element.price.toString())! <=
                                              val.end));
                                  break;
                                case 5:
                                  filterPrice.assignAll(homeScreenController
                                      .shoes
                                      .where((element) =>
                                          double.tryParse(
                                                  element.price.toString())! >=
                                              val.start &&
                                          double.tryParse(
                                                  element.price.toString())! <=
                                              val.end));
                                  break;
                              }

                              level.value = 2;
                            },
                          );
                        },
                        values: val,
                      ),
                    ),
                  ],
                ))));
  }

  Column mainList(RxList<Product> list) {
    return Column(
      children: [
        (Dim.small-3).height,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           
             (Dim.xlarge+6).width,
            Text(style: textStyle.bodyMedium, '${list.length} products'),
          ],
        ),
        (Dim.large/2).height,
        SizedBox(
          height: Get.height / 1.28,
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15),
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(DetailKala(
                            index,
                            selectPage,
                            list,
                          ));
                        },
                        child: Container(
                          height: Get.height / 5.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.asset(list[index].ima!).image)),
                        ),
                      ),
                    
                      (Dim.large/2).height,
                      Text(style: textStyle.bodyMedium, list[index].name!),
                    
                      (Dim.large/2).height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(style: textStyle.bodyMedium, list[index].brand!),
                          Text(
                              style: textStyle.bodyMedium,
                              '${list[index].price}\$'),
                        ],
                      ),
                    ],
                  ),
                );
              })),
        ),
      ],
    );
  }
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
