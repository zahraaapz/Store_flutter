import 'package:appstore/component/extention.dart';
import 'package:appstore/constant/color.dart';
import 'package:appstore/controller/homeScreenController.dart';
import 'package:appstore/route_manager/route_name.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../model/Model.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  List<Product> filteredItems = [];

  @override
  void initState() {
    super.initState();

    filteredItems.addAll(Get.find<HomeScreenController>().suggestlist);
  }

  void filterItems(String query) {
    List<Product> temp = [];

    temp.addAll(Get.find<HomeScreenController>().searchKala);

    if (query.isNotEmpty) {
      temp.retainWhere((item) {
        return item.name!.toLowerCase().contains(query.toLowerCase()) ||
            item.brand!.toLowerCase().contains(query.toLowerCase());
      });
    }

    setState(() {
      filteredItems.clear();
      filteredItems.addAll(temp);
    });
  }

  void resultSeach(String query) {
    List<Product> temp = [];

    temp.addAll(Get.find<HomeScreenController>().searchKala);

    if (query.isNotEmpty) {
      if (temp.any((item) =>
              item.name!.toLowerCase().contains(query.toLowerCase()) ||
              item.brand!.toLowerCase().contains(query.toLowerCase())) ==
          false) {
        Get.toNamed(RouteNames.searchResult);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
         (Dim.large).width,
          Container(
            decoration: const BoxDecoration(
                color: Rang.toosi,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            width: Get.width / 1.25,
            height: Get.height / 15,
            child: TextField(
              onSubmitted: resultSeach,
              controller: searchController,
              onChanged: filterItems,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Rang.grey),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ),
         
           (Dim.large/2).width,
        ]),
        body: ListView.builder(
          itemCount: filteredItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: Get.width / 6,
                    height: Get.height / 14,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9)),
                        image: DecorationImage(
                            image: Image.asset(filteredItems[index].ima!).image,
                            fit: BoxFit.cover)),
                  ),
                
                   (Dim.large/2).width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'name:  ${filteredItems[index].name!}',
                        style: textStyle.bodyMedium,
                      ),
                       (Dim.xlarge).height,
                    
              
                      Text(
                        'brand:  ${filteredItems[index].brand!}',
                        style: textStyle.bodyMedium,
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
