import 'package:appstore/constant/color/color.dart';
import 'package:appstore/controller/homeScreenController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/text_style.dart';
import '../../model/Model.dart';

import 'searchResult.dart';

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
        Get.to(const SearchResult());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          const SizedBox(
            width: 20,
          ),
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
          const SizedBox(
            width: 10,
          )
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
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'name:  ${filteredItems[index].name!}',
                        style: textStyle.bodyMedium,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
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
