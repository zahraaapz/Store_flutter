import 'package:appstore/color/color.dart';
import 'package:appstore/controller/homeScreenController.dart';
import 'package:appstore/view/firstScreen/mainScreen.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/Model.dart';
import '../../model/component.dart';
import 'searchResult.dart';




class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  List<Kala> filteredItems =[];
HomeScreenController homeScreenController=Get.put(HomeScreenController());
  @override
  void initState() {
    super.initState();
    
    filteredItems.addAll(homeScreenController.suggestlist);
  }

  void filterItems(String query) {
    List<Kala> temp = [];
   
    temp.addAll(homeScreenController.searchKala);
   
    if (query.isNotEmpty) {
      temp.retainWhere((item) {
        
     return   item.name!.toLowerCase().contains(query.toLowerCase()) ||
       item.brand!.toLowerCase().contains(query.toLowerCase());
        

        });
  
        
    } 

    setState(() {
      filteredItems.clear();
      filteredItems.addAll(temp);
    });
  }  
void resultSeach(String query) {
    List<Kala> temp = [];
   
    temp.addAll(homeScreenController.searchKala);
   
    if (query.isNotEmpty) {
    if (temp.any((item) => item.name!.toLowerCase().contains(query.toLowerCase()) ||
       item.brand!.toLowerCase().contains(query.toLowerCase()))==false) {

        Get.to(const SearchResult());

       }
        
    } 

  } 
  



  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
          actions: [GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
              child:const Icon(Icons.arrow_back_ios,color: Colors.black,)),
              const SizedBox(width:20,),      
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Rang.toosi, borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              width: 350,
              height: 50,
              child: TextField(
           onSubmitted: resultSeach,
                controller: searchController,
                onChanged: filterItems,
                decoration:InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Rang.grey),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
          ),
        ]),
        body: ListView.builder(
          itemCount: filteredItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:  const EdgeInsets.all(10.0),
              child: Row(
                children: [

                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                      image: DecorationImage(
                        
                        image:Image.asset(filteredItems[index].ima!).image,fit: BoxFit.cover)
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
             crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            
                    Text( 'name:  ${filteredItems[index].name!}',style: textStyle.bodyMedium,),
                  const SizedBox(height: 25,),
                    Text( 'brand:  ${filteredItems[index].brand!}',style: textStyle.bodyMedium,)
                  ],),
                ],
              ),
            );
            
          },
        ),
      ),
    );

  }
}

