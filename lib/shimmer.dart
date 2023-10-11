import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
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
                  height: 670,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 10,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      
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
                              height: 160,
                              width:double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10,bottom: 8,right: 3),
                              height: 10,
                              width:double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Container(
                              
                              height: 10,
                              width: 100,
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
       height: 200,
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
                        height: 10,
                         
                            width: size.width / 3.5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 8,right: 3)
,                        height: 10,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),  Container(
                        
                        height: 10,
                        width: 70,
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
