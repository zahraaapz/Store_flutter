import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/text_style.dart';
import '../../constant/color.dart';

Future<void> showMyDialog(
  context,filterBrand,selectPage,homeScreenController,brands,RxInt level,checkBoxBrands,filterListBrand,selectedBrand) async {
    return showDialog<void>(
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, setState) => Dialog(
                child: SizedBox(
                  height: Get.height/1.9,
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