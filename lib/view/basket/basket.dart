import 'package:appstore/component/extention.dart';
import 'package:appstore/constant/storage.dart';
import 'package:appstore/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/dim.dart';
import '../../component/text_style.dart';
import '../../model/Model.dart';
import '../../route_manager/route_name.dart';
import '../../widget/basketWidget/cut.dart';
import '../../widget/iconANDtitle.dart';
import '../../widget/emptyColumn.dart';
import '../../widget/myTextField.dart';
import '../../constant/string.dart';

class Basket extends StatefulWidget {
  Basket({super.key}) {
    qnty = List.generate(myBagList.length, (index) => 1);
    print(qnty!.length);
  }
  List<int>? qnty;
  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  int indexOfqnty = 0;
  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromARGB(31, 116, 114, 114),
          body: Column(
            children: [
              iconANDtitle('My Bag', Icons.close),
             myBagList.isEmpty
                  ? const EmptyColumn(
                      image: 'assets/image/emptyBag.png',
                      title: MyString.bagEmptytile,
                      content: MyString.bagEmptyContent,
                    )
                  : Column(children: [
                      SizedBox(
                        height: Get.height / 2.5,
                        child: basketList(size, widget.qnty!),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: myTextField(
                            width: double.infinity,
                            color: Colors.white,
                            size: size,
                            hintText: 'Apply Copon Code'),
                      ),
                      ClipPath(
                        clipper: Cut(x: Get.width / 9, y: Get.height / 30),
                        child: Container(
                          width: Get.width / 1.05,
                          height: Get.height / 3.16,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: Colors.black, blurRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: columnPrices(size, widget.qnty),
                          ),
                        ),
                      )
                    ])
            ],
          )),
    );
  }

  ListView basketList(size, List<int> qnty) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: myBagList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height / 4,
              decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(blurRadius: 1.6)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      height: size.height / 6,
                      width: size.width / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(myBagList[index].ima!),
                              fit: BoxFit.fill)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(myBagList[index].brand!,
                              style: textStyle.bodyMedium),
                          (Dim.large / 2).height,
                          Text(myBagList[index].name!,
                              style: textStyle.bodyMedium),
                          (Dim.large / 2).height,
                          Container(
                            color: Rang.toosi,
                            height: size.height / 20,
                            child: Row(
                              children: [
                                Text(
                                    style: textStyle.bodyMedium,
                                    'Qnty: ${qnty[index]}'),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                      qnty[index] = qnty[index] + 1;
                                        indexOfqnty = index;
                                       });
                                    },
                                    icon: const Icon(Icons.add)),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      indexOfqnty = index;
                                      qnty[index] = qnty[index] - 1;
                                       
                                   if(qnty.contains(0)){

                                    myBagList.removeAt(index);
                                    
                                    qnty.removeAt(index);
                                  
                                      }});
                                       
                                },
                                  icon: const Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ),
                          (Dim.large / 2).height,
                          Text(
                              style: textStyle.bodyMedium,
                              '${int.parse(myBagList[index].price!) * qnty[index]}\$'),
                        ],
                      ),
                    )
                  ],
                ),
                (Dim.large / 2).height,
                const Divider(
                  height: 1,
                  thickness: 1,
                  endIndent: 3,
                  indent: 3,
                  color: Rang.blue,
                ),
                (Dim.large / 4).height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (Dim.small).width,
                    Center(child: Text('Move to Wishlist', style: textStyle.displaySmall)),
                    (Dim.small).width,
                    const SizedBox(
                      height: 20,
                      child: VerticalDivider(
                        color: Rang.blue,
                        thickness: 1,
                        indent: 3,
                        endIndent: 1,
                      ),
                    ),
                    (Dim.small).width,
                    InkWell(
                      onTap: () {
                        setState(() {
                          myBagList.remove(myBagList[index]);
                        });
                      },
                      child: Text(
                        'Remove',
                        style: textStyle.displaySmall,
                      ),
                    ) ,
                    (Dim.large*2).width,
                  ],
                )
              ]),
            ),
          );
        }));
  }

  Column columnPrices(size, qnty) {
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

      totalPrice = double.parse(orderDetail[0].price!) -
          double.parse(orderDetail[3].price!);
    });

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Dim.medium.height,
      Text('Order detail', style: textStyle.displaySmall),
      SizedBox(
        height: size.height / 5,
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
                              fontSize: 16,
                              color: Rang.greylight)),
                      Text(orderDetail[ix].price!, style: textStyle.bodyMedium),
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
              Text('Total Bag Amount', style: textStyle.bodyMedium),
              Text(totalPrice.toString(), style: textStyle.bodyMedium),
            ],
          ),
          ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                  backgroundColor: MaterialStateProperty.all(Rang.blue)),
              onPressed: (() {
                MyStorage.box.read(StorageNames.street) == null
                    ? Get.toNamed(RouteNames.address)
                    : Get.toNamed(RouteNames.payment);
              }),
              child: Text('Place Order', style: textStyle.headlineLarge)),
        ],
      )
    ]);
  }
}


