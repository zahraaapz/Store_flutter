  import 'package:flutter/material.dart';

import '../../component/text_style.dart';
import '../../model/Model.dart';
import '../../view/SelectType/select_kala.dart';

SizedBox typeList(Size size,select) {
    //seslect clothes or...

    return SizedBox(
      //sizedbox main
      height: size.height / 6.6,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: Model.modelList.length,
          itemBuilder: ((context, index) {
            return Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        select.value = index;
                        Future.delayed(const Duration(milliseconds: 700)).then(
                            (value) =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => Selectkala(
                                          index,
                                        )))));
                      },
                      child: Container(
                        //list container
                        width: size.width / 6,
                        height: size.height / 11,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(Model.modelList[index].ima),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        Model.modelList[index].title,
                        style: textStyle.bodyMedium,
                      ),
                    )
                  ],
                ),
              ),
            ]);
          })),
    );
  }