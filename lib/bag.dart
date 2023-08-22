import 'package:appstore/address.dart';
import 'package:appstore/color/color.dart';
import 'package:appstore/notif.dart';
import 'package:appstore/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/Model.dart';
import 'model/component.dart';
import 'model/string.dart';
import 'view/firstScreen/mainScreen.dart';

class Bag extends StatefulWidget {
  // ignore: use_key_in_widget_constructors

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  List<int>? qnty = List.filled(4, 1);
  int indexOfqnty = 0;
  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
          body: Column(
            children: [
              iconANDtitle('My Bag', Icons.close),
              myBagList.isEmpty
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 90,
                        ),
                        Image.asset('assets/image/emptyBag.png'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: titleEmtypage(MyString.bagEmptytile),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: contentEmptyPages(MyString.bagEmptyContent),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        SizedBox(
                          height: 50,
                          width: 250,
                          child: ElevatedButton(
                            onPressed: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Home())));
                            }),
                            style: buttonModel(),
                            child:  Text(
                              'continue shopping'
                             ,style: textStyle.headlineLarge,
                            ),
                          ),
                        )
                      ],
                    )
                  : Column(children: [
                      SizedBox(
                        height: Get.height / 2.5,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: myBagList.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      boxShadow: const [BoxShadow(blurRadius: 1.6)],
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(15)),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      myBagList[index].ima!),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(myBagList[index].brand!
                                                  ,style: textStyle.bodyMedium),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(myBagList[index].name!
                                                 ,style: textStyle.bodyMedium),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                    setState(() {
                                                              qnty![index] =
                                                                  qnty![index] +
                                                                      1;
                                                              indexOfqnty =
                                                                  index;
                                                            });
                                                          
                                                },
                                                child: Container(
                                                  color: Rang.toosi,
                                                  height: 40,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(style: textStyle.bodyMedium,
                                                            'Qnty: ${qnty![index]}'),
                                                        const Icon(
                                                            Icons.add) ,
                                                           
                                                         GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                                qnty![index] =
                                                                  qnty![index] -
                                                                      1;
                                                              indexOfqnty =
                                                                  index; 

                                                              qnty![index]==0?
                                                              myBagList.remove(myBagList[index]):null;   
                                                            });
                                                          },
                                                           child: const Icon(
                                                              Icons.remove),
                                                         ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(style: textStyle.bodyMedium,
                                                  '${int.parse(myBagList[index].price!) * qnty![index]}\$'),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    const Divider(
                                      height: 1,
                                      thickness: 1,
                                      endIndent: 3,
                                      indent: 3,
                                      color: Rang.blue,
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 60,
                                        ),
                                         Text('Move to Wishlist',
                                            style: textStyle.displaySmall),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                          child: VerticalDivider(
                                            color: Rang.blue,
                                            thickness: 1,
                                            indent: 3,
                                            endIndent: 1,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                               myBagList.remove(myBagList[index]);
                                            });
                                                 
                                          },
                                          child: Text('Remove'
                                            ,style: textStyle.displaySmall,
                                        ),
                                    )],
                                    )
                                  ]),
                                ),
                              );
                            })),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                boxShadow: const [ BoxShadow(blurRadius: 1)],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: TextField(
                              decoration: InputDecoration(
                                
                                  hintText: 'Apply Copon Code',
                                  suffixIcon:  Padding(
                                    padding: const EdgeInsets.only(top: 12.0,left: 6),
                                    child: Text(
                                      'Check',
                                      style: textStyle.displaySmall,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          const BorderSide(color: Rang.blue)),
                                  hintStyle: const TextStyle(color: Rang.greylight),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(15))),
                            )),
                      ),
                      ClipPath(
                        clipper: cut(x: 35, y: 20),
                        child: Container(
                          width: Get.width/1.05,
                          height: 290,

                          decoration: BoxDecoration(
                              color: Colors.white,
                            
                              boxShadow: [BoxShadow(color: Colors.black,blurRadius: 1)],
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: columnPrices(),
                          ),
                        ),
                      )
                    ])
            ],
          )),
    );
  }

  Column columnPrices() {
    var sum = 0.0;
    setState(() {
      orderDetail[1].price = '20%';
      orderDetail[2].price = '20\$';
      for (int i = 0; i < myBagList.length; i++) {
        sum = (double.parse(myBagList[i].price!) * qnty![i]) + sum;
      
      }
      orderDetail[3].price = (sum * 0.2 + 20).toStringAsFixed(2).toString();



      sum = 0.0;
      for (int i = 0; i < myBagList.length; i++) {
        sum = (double.parse(myBagList[i].price!) * qnty![i]) + sum;
       
      }
      orderDetail[0].price = sum.toStringAsFixed(2).toString();

      totalPrice=double.parse(orderDetail[0].price!)-double.parse(orderDetail[3].price!);
    });

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
     
        children: [
          const SizedBox(height: 15,),
           Text('Order detail',
              style: textStyle.displaySmall),
          SizedBox( height: 140,
        
            child: ListView.builder(
             
                itemCount: orderDetail.length,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, ix) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(orderDetail[ix].title!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Auliare',
                              fontSize: 16, color: Rang.greylight)),
                      Text(
                           orderDetail[ix].price!,
                         style: textStyle.bodyMedium),
                    ],
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Bag Amount',style: textStyle.bodyMedium),
                  Text(totalPrice.toString(),style: textStyle.bodyMedium),
                ],
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      backgroundColor: MaterialStateProperty.all(Rang.blue)),
                  onPressed: (() {
                    Address().box.read('street')== null ?
                    Get.offAll(Address()):Get.to(Payments());
                  }),
                  child: Text('Place Order',style: textStyle.headlineLarge)),
            ],
          )
        ]);
  }
}

class cut extends CustomClipper<Path> {
  double x, y;
  cut({required this.x, required this.y});
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - x - y, 0)
      ..arcToPoint(Offset(size.width - x, 0),
          clockwise: false, radius: Radius.circular(5))
      ..lineTo(size.width - 3 * x - y, 0)
      ..arcToPoint(Offset(size.width - 3 * x, 0),
          clockwise: false, radius: Radius.circular(5))
      ..lineTo(size.width - 5.6 * x, 0)
      ..arcToPoint(Offset(size.width - 5 * x, 0),
          clockwise: false, radius: Radius.circular(5))
      ..lineTo(size.width - 7.6 * x, 0)
      ..arcToPoint(Offset(size.width - 7 * x, 0),
          clockwise: false, radius: Radius.circular(5))
      ..lineTo(size.width - 9.8 * x, 0)
      ..arcToPoint(Offset(size.width - 9.2 * x, 0),
          clockwise: false, radius: Radius.circular(5))
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height);

    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(cut oldCLipper) => true;
}
