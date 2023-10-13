import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
          child: Column(
        children: [
          Shimmer.fromColors(
            enabled: true,
            baseColor: const Color.fromARGB(155, 158, 158, 158),
            highlightColor: const Color.fromARGB(90, 158, 158, 158),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height/1.24,

                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 10,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 1.5,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left:8,right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                            padding: const EdgeInsets.all(8),

                              height: Get.height/5,
                              width:double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top:10,bottom: 8,right: 3),
                              height: Get.height/80 ,
                              width:double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                             height:Get.height/80,
                              width: Get.width/5,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ))
    ;
  }
}


class ShimmerSuggestList extends StatelessWidget {
  const ShimmerSuggestList({
    super.key,
    required this.size
  });
final size;
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
       height: size.height/4.7,
       width: double.infinity,
        child:
          ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: 3,
             itemBuilder: (context,index)=>
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                    enabled: true,
            baseColor: const Color.fromARGB(155, 158, 158, 158),
            highlightColor: const Color.fromARGB(90, 158, 158, 158),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                         height: size.height / 9,
                            width: size.width / 3.5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top:10,bottom: 8,right: 3),
                        height: size.height/80,
                         
                            width: size.width / 3.5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 8,right: 3)
,                       height: size.height/80,
                        width:size.width/5 ,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),  Container(
                        height: size.height/80,
                        width:size.width/6
                        ,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  
                            
                      ),
                ),
                  ),
          ),
    )
  
    ;
  }
}
