// ignore_for_file: must_be_immutable

import 'package:appstore/component/extention.dart';
import 'package:appstore/constant/color.dart';
import 'package:appstore/controller/homeScreenController.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/view/FirstScreen/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/text_style.dart';
import '../../constant/dim.dart';
import '../../widget/selectkalaWidget/bottomsheetLimitedPrice.dart';
import '../../widget/selectkalaWidget/columnList.dart';
import '../../widget/selectkalaWidget/dialog.dart';
import '../../widget/shimmerList.dart';
import 'selectTypeMethod/method.dart';

class Selectkala extends StatefulWidget {
  int selectPage;

  Selectkala(this.selectPage, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<Selectkala> createState() => _SelectkalaState();
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

   int ?lenght;
  var homeScreenController= Get.find<HomeScreenController>();


 late List brands;
 late List<double> prices;

  //for limit price
 late RangeValues val;

  _SelectkalaState(

  );


showlist(){
  setState(() {
        lenght = lenghtLists(widget.selectPage, homeScreenController);

    checkBoxBrands = List.generate(lenght!, (index) => false);
    brands = List.generate(
        lenght!, (index) => brandItem(widget.selectPage, index, homeScreenController));

    prices = List.generate(
        lenght!,
        (index) => double.parse(
            priceLists(widget.selectPage, homeScreenController, index).toString()));
    prices.sort();
    val = RangeValues(
      prices.first,
      prices.last,
    );
  });


  
}



  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
        child: Scaffold(
          body: Stack(children: [
            Obx(
              () => Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                    
                      (Dim.medium+3).width,
                          IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Rang.blue,
                    ),
                    onPressed: () {
                     Get.offAll(Home());
                    },
                  ),
                      
                       (Dim.xlarge).width,
                      Text(
                        widget.selectPage == 0
                            ? 'Skincare'
                            : widget.selectPage == 1
                                ? 'Watches'
                                : widget.selectPage == 2
                                    ? 'Handbags'
                                    : widget.selectPage == 3
                                        ? 'jewellery'
                                        : widget.selectPage == 4
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
                            : selectList(widget.selectPage,homeScreenController),widget.selectPage)
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
                  IconButton(
                      onPressed: () {
                          homeScreenController.suggestlist.isEmpty?null:
                         filterBrandOrPrice(context);
                        showlist();
                      },
                      icon: const Icon(Icons.filter_alt_outlined)),
                  IconButton(
                    onPressed: (() {
                      homeScreenController.suggestlist.isEmpty?null:
                      filterBySort(context);
                     showlist();
                    }),
                    icon: const Icon(Icons.sort_rounded),
                  ),
                ],
              ),
            )
          ]),
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
                          sortListHightoLow(widget.selectPage, homeScreenController);
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
                            sortLisLowtoHigh(widget.selectPage, homeScreenController);
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
        RadioListTile(  
          
          groupValue:selectedRadioTile ,
           title: Text(
                              'Brand',
                              style: textStyle.headlineMedium,
                            ),
                            activeColor:Rang.blue,
                            value: '3',
                            onChanged: (value) {
                              setState(() {
                               selectedRadioTile= value.toString();
                               checkBoxPriceBrand[0] = true;
                              });

                              checkBoxPriceBrand[0] == true
                                  ? showMyDialog(context,filterBrand,widget.selectPage,homeScreenController,brands, level,checkBoxBrands,filterListBrand,selectedBrand)
                                  : null;
                            }),
                            RadioListTile(
                              groupValue: selectedRadioTile,
                                   title: Text(
                              'Price',
                              style: textStyle.headlineMedium,
                            ),
                            fillColor: MaterialStateProperty.all(Rang.blue),
                            value: '4',
                            onChanged: (value) {
                              setState(() {
                                selectedRadioTile = value.toString();
                      checkBoxPriceBrand[1] = true;

                              });
                              checkBoxPriceBrand[1] == true
                                  ? bottomSheetLimitedPrice(context,val,prices,filterPrice,homeScreenController,widget.selectPage, level)
                                  : null;
                            }
                            )
                     
                    
                      ],
                    ),
                  ));
        }));
  }




}


