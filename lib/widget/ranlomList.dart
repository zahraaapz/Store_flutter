import 'package:appstore/model/Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/text_style.dart';


class randomlist  extends StatefulWidget {
randomlist({super.key,this.list});
RxList <Product> ?list;

  @override
  State<randomlist> createState() => _randomlistState();
}

class _randomlistState extends State<randomlist> {




  @override
  Widget build(BuildContext context) {
       return SizedBox(
      width: double.infinity,
      height: Get.height / 3.2,
      child: ListView.builder(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: Get.width / 1.8,
                child:  Column(children: [
                    Container(
                      height: Get.height / 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(widget.list![index].ima!))
                              ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: Get.width / 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.list![index].brand!,
                              style: textStyle.bodyMedium,
                            ),
                            Text(widget.list![index].name!,
                                style: textStyle.bodyMedium),
                            Text(widget.list![index].price!,
                                strutStyle: const StrutStyle(height: 2),
                                style: textStyle.bodyMedium),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
             
            );
          })),
    );
  }
}

      
         

