import 'package:appstore/model/Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/text_style.dart';


class Randomlist  extends StatefulWidget {
const Randomlist({super.key, this.list});

final  RxList <Product> ? list;
@override
State<Randomlist> createState() => _RandomlistState();
}

class _RandomlistState extends State<Randomlist> {

 final  RxList <Product>  change=RxList();

@override
void initState(){

  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
   change.shuffle();
   });
change.addAll(widget.list!);
 
}



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
                child:  Obx(()=>
                  Column(children: [
                      Container(
                        height: Get.height / 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(change[index].ima!))
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
                                change[index].brand!,
                                style: textStyle.bodyMedium,
                              ),
                              Text(change[index].name!,
                                  style: textStyle.bodyMedium),
                              Text(change[index].price!,
                                  strutStyle: const StrutStyle(height: 2),
                                  style: textStyle.bodyMedium),
                            ],
                          ),
                        ),
                      ),
                    ]),
                ),
                ),
             
            );
          })),
    );
  }
}

      
         

