// ignore_for_file: must_be_immutable

import 'package:appstore/color/color.dart';
import 'package:appstore/controller/homeScreenController.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/view/firstScreen/mainScreen.dart';

import 'package:appstore/view/selectType/detail_kala.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/component.dart';
import '../../model/listDetail.dart';

class Selectkala extends StatefulWidget {
  int select;
   RxList<Kala> ?filterList=RxList();
  final HomeScreenController homeScreenController;
  Selectkala(
    this.select,
    this.homeScreenController,
    {this.filterList}
  );

  @override
  // ignore: no_logic_in_create_state
  State<Selectkala> createState() =>
      _SelectkalaState(select, homeScreenController);
}

class _SelectkalaState extends State<Selectkala> {
  String? selectRadioTile;
  RxList<Kala> filterList=RxList();
  List <bool> checkBoxPriceBrand = [false,false];
  List  selectedBrand=[];
  List <bool>? checkBoxBrands;
  int selectPage;
  late int indx;
  late int lenght;
  final HomeScreenController homeScreenController;
  late List<bool> fav;
  var box = GetStorage();
  List? brands;
 List<double>? prices;
 RangeValues ?val;
 



  _SelectkalaState(
    this.selectPage,
    this.homeScreenController,
  );

 

  @override
  initState() {
 

    super.initState();
    lenght = ListDetail().LenghtLists(selectPage);
    fav = List.generate(lenght, (index) => box.read('fav$index') ?? false);
    checkBoxBrands = List.generate(lenght, (index) =>  false);
    brands = List.generate(lenght, (index) => ListDetail().brandItem(selectPage, index));

   prices= List.generate(lenght, (index) => double.parse(homeScreenController.bag[index].price.toString())  );
   prices!.sort();
     val=RangeValues(prices!.first, prices!.last,);
  }
  Future<void>showMyDialog()async{
return  showDialog<void>(
                                  context: context,
                                  builder: (context) => 
                                  StatefulBuilder(
                                    builder: (context, setState) => 
                                    
                                   Dialog(
                                    
                                      child:SizedBox(
                                        height: 450,
                                        child: Column(children: [
                                    
                                              SizedBox(
                                                height: 400,
                                                child: ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: brands?.length ,
                                                shrinkWrap: true,
                                                  itemBuilder: (BuildContext context, int index) =>
                                                   CheckboxListTile(
                                                     title: Text( 
                                                    brands?[index]),
                                                        fillColor: MaterialStateProperty.all(Rang.blue),
                                                    onChanged: (bool? value) { 
                                                      setState(() {
                                                        checkBoxBrands![index]=value!;
                                                        indx=index;
                                                     
                                                           if(checkBoxBrands![indx]==true){
                                                           selectedBrand.add(brands![indx]);

                                                  ListDetail().filterBrand(selectPage,filterList,selectedBrand) ;                                             
                                                       
                                                   }else{
                                                   filterList.removeWhere((e)=>selectedBrand.contains(e.brand));
                                                   selectedBrand.remove(brands![indx]);
                                                    
                                                   }  
                                                      },);      },
                                                     value: checkBoxBrands![index],
                                                
                                                  ),
                                                ),
                                              )   ]),
                                      ),
                                  ),
                                ));

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Obx(
          () => homeScreenController.waiting.value == false
              ? Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => Home())));
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Rang.blue,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                            style: textStyle.bodyMedium,
                       filterList.isEmpty?     selectPage == 0
                                ? '${ListDetail.skincareLenght} products'
                                : selectPage == 1
                                    ? '${ListDetail.WatchesLenght} products'
                                    : selectPage == 2
                                        ? '${ListDetail.handBagLenght} products'
                                        : selectPage == 3
                                            ? '${ListDetail.jewelleryLenght} products'
                                            : selectPage == 4
                                                ? '${ListDetail.eyewearLenght} products'
                                                : '${ListDetail.shoesLenght} products':'${filterList.length} products'),
                      ],
                    ),
                  ),
                  mainList(filterList.isEmpty?  selectPage == 0
                                              ? ListDetail.skincareName
                                              : selectPage == 1
                                                  ? ListDetail.WatchesName
                                                  : selectPage == 2
                                                      ? ListDetail.handBagName
                                                      : selectPage == 3
                                                          ? ListDetail.jewellerName
                                                              
                                                          : selectPage == 4
                                                              ?ListDetail.eyewearName
                                                              : ListDetail.shoesName:filterList),
                  //  SpinKitThreeBounce(
                  //       color: Rang.blue,
                  //     ),
                ])
              : const SpinKitCircle(
                  color: Rang.blue,
                ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: ((context) {
                          return StatefulBuilder(
                              builder: (context, setState) => Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                                      color: Colors.white,
                                    ),
                                    height: Get.height / 4,
                                    child: Column(
                                      children: [
                                        CheckboxListTile(
                                          title: Text('Brand'),
                                          fillColor: MaterialStateProperty.all(Rang.blue),
                                            value: checkBoxPriceBrand[0],
                                            onChanged: (value) {
                                              setState(() {
                                                checkBoxPriceBrand[0] = value!;
                                              
                                              });
                              
                                checkBoxPriceBrand[0]==true?
                              showMyDialog()
                                :null; 
                                       
                                          }),  
                                            
                                          CheckboxListTile(
                                          title: Text('Price'),
                                          fillColor: MaterialStateProperty.all(Rang.blue),
                                            value: checkBoxPriceBrand[1],
                                            onChanged: (value) {
                                              setState(() {
                                                checkBoxPriceBrand[1] = value!;
                                               
                                              });
                                             checkBoxPriceBrand[1]==true?
                                             bottomSheetLimitedPrice(context):null;   }),
                                  ],
                                    ),
                                  ));
                        }));
                  },
                  child: const Icon(Icons.filter)),
              InkWell(
                onTap: (() {
                  showModalBottomSheet(
                      //bottomsheetfilter
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: ((context) {
                        return StatefulBuilder(
                          builder: (context, setState) => Container(
                            height: 230,
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
                                    padding: EdgeInsets.only(
                                        left: 25, bottom: 8, top: 8),
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
                                    groupValue: selectRadioTile,
                                    value: '0',
                                    onChanged: (value) {
                                      setState(() {
                                        selectRadioTile = value.toString();
                                     ListDetail().sortListHightoLow(selectPage);
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
                                      groupValue: selectRadioTile,
                                      value: '1',
                                      onChanged: (value) {
                                        setState(() {
                                          selectRadioTile = value.toString();
                                       ListDetail().sortLisLowtoHigh(selectPage);
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
                                    title: Text('Lasted product',
                                        style: textStyle.bodyMedium),
                                    groupValue: selectRadioTile,
                                    value: '2',
                                    onChanged: (value) {
                                      setState(() {
                                        selectRadioTile = value.toString();
                                      });
                                    },
                                  ),
                                ]),
                          ),
                        );
                      }));
                }),
                child: const Icon(Icons.sort_rounded),
              ),
            ],
          ),
        )
      ]),
    ));
  }

  Future<dynamic> bottomSheetLimitedPrice(BuildContext context) {
    return showModalBottomSheet(
                                       context:context,
                                       builder:(context) => 
                                      StatefulBuilder(builder:(context, setState) =>
                                      Container(
                                        height: Get.height/4,
                                           decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                                    color: Colors.white,
                                    
                                  ),child:Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                              
                               SliderTheme(
                                data:SliderTheme.of(context).copyWith(
                                  activeTrackColor: Rang.blue,
                                  inactiveTrackColor:Rang.greylight,
                                  
                                  thumbColor: Rang.blue,
                                 

                                ) ,
                                child:RangeSlider(
                                    labels: RangeLabels(val!.start.toString(),val!.end.toString()),
                                    min: prices!.first,
                                    max:prices!.last,
                                    divisions: 15,
                                     onChanged: (value) {
                                       setState(() {
                                     val =value;
                                     
                                     homeScreenController
                                     .bag.where((element) =>double.tryParse(element.price.toString())!>=val!.start && 
                                     double.tryParse(element.price.toString())!<=val!.end).toList();
                                      

                                       },);
                                     }, values: val!,
                                  ),
                               ) ,   ElevatedButton(
                                onPressed: (){
                                  setState(() {
                            
                             
                                      
                                        });
                                            

                                }, style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                  backgroundColor: MaterialStateProperty.all(Rang.blue)),
                             child: Text('Apply',style: textStyle.headlineLarge)
                               )      ],
                                  )


                                     )));
  }

  SizedBox mainList(RxList<Kala> list) {
    return SizedBox(
                  height: 670,
                  child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:list.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8, left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => DetailKala(
                                                  index,
                                                  selectPage,
                                                list,
                                                  isFavorite: fav[index],
                                                ))));
                                  },
                                  child: Container(
                                    height: 160,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: Image.asset(list[index].ima!
                                                )
                                                .image)),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        style: textStyle.bodyMedium,
                                        list[index].name!
                                          ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          fav[index] = !fav[index];
                                          box.write('fav$index', fav[index]);
                                          if (fav[index] == true &&
                                              !wishList.contains(list[index])) {
                                            wishList.add(list[index]);
                                          }
                                          if (wishList.contains(list[index]) &&
                                              fav[index] == false) {
                                            wishList.remove(list[index]);
                                          }
                                        });
                                      },
                                      child: Icon(
                                        fav[index] == false
                                            ? Icons.favorite_border
                                            : Icons.favorite,
                                        size: 19,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        style: textStyle.bodyMedium,
                                       list[index].brand!
                                           ),
                                    Text(
                                        style: textStyle.bodyMedium,
                                        '${list[index].price}\$'
                                           ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        })),
                  
                );
  }
  
}
