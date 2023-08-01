import 'package:appstore/color/color.dart';
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



 
  @override
  Widget build(BuildContext context) {
 RxList i = RxList.filled(myBagList.length, 1);

   
    return SafeArea(
      child: Scaffold(
          backgroundColor: Rang.toosi,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                iconANDtitle('My Bag',Icons.close),
                myBagList.isEmpty ?  Column(children: [

                 const SizedBox(
            height: 90,
          ),
          Image.asset('assets/wish.png'),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Home())));
            }),
            style: buttonModel(
                ),
            child: const Text(
              'continue shopping',
              style: TextStyle(color: Colors.white),
            ),
            ),
          )
            ],):Column(children:[
           SizedBox(
                  height:Get.height/2.5,
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
                                boxShadow: [BoxShadow(blurRadius:4)],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
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
                                            image:
                                                AssetImage(myBagList[index].ima!),
                                            fit: BoxFit.fill)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(myBagList[index].brand!,
                                            style: TextStyle(fontSize: 15)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(myBagList[index].name!,
                                            style: TextStyle(fontSize: 15)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          color: Rang.toosi,
                                          height: 40,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Obx(()=> Text('Qnty: ${i[index]}')),
                                                InkWell(
                                                    onTap: () {
                                                      
                                                          i[index] =i[index] +1;
   
                                                    
                                            
 
   },
                                                    child: const Icon(Icons.add))
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Obx(()=> Text((int.parse(myBagList[index].price!)*i[index]).toString())),
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
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 60,
                                  ),
                                  Text('Move to Wishlist',
                                      style: TextStyle(
                                          color: Rang.blue, fontSize: 16)),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  SizedBox(
                                    height: 20,
                                    child: VerticalDivider(
                                      color: Rang.blue,
                                      thickness: 1,
                                      indent: 3,
                                      endIndent: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  InkWell(
                                    onTap: () {
                                //      myBagList.remove(myBagList[index]);
                                    },
                                    child: const Text('Remove',
                                        style: TextStyle(
                                            color: Rang.blue, fontSize: 16)),
                                  ),
                                ],
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Apply Copon Code',
                            suffixIcon: const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Check',
                                style: TextStyle(
                                    color: Rang.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Rang.blue)),
                            hintStyle: TextStyle(color: Rang.greylight),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15))),
                      )),
                ),
                ClipPath(
                  clipper: cut(x: 35, y: 20),
                  child: Container(
                    width: double.infinity,
                    height: 380,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: columnPrices(i),
                  ),
                )
            ])],
            ),
          )),
    );
  }





  Column columnPrices(i) {
   
  var sum=0.0;
  setState(() {

orderDetail[1].price='20%';
orderDetail[2].price='20\$';

myBagList.forEach((element) {
  sum=(double.parse(element.price!)+sum);
   
  orderDetail[3].price=(sum*0.2+20).toString();
 
  
 
});
  sum=0.0;
myBagList.forEach((element) {
   
      sum=(double.parse(element.price!)+sum);
   orderDetail[0].price=(sum).toString();

});
    });
    

    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [    
                         
                          const Text('Order detail',
                              style:
                                  TextStyle(color: Rang.blue, fontSize: 16)),
                                
                          SizedBox(
                            height: 140,
                            child: ListView.builder(
                              itemCount: orderDetail.length,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, ix) => 
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(orderDetail[ix].title!,
                                        style: const TextStyle(
                                            fontSize: 16, color: Rang.greylight)),
                                   Text(orderDetail[ix].price==null?'k':orderDetail[ix].price!, style: const TextStyle(fontSize: 16)),
                                  ],
                             ),
                           )
                            ),
                          ),
                        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Total Bag Amount',
                                      style: TextStyle(fontSize: 16)),
                                  Text('\$200',
                                      style: TextStyle(fontSize: 13)),
                                ],
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                     shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Rang.blue)),
                                  onPressed: (() {}),
                                  child: Text('Place Order')),
                            ],
                          )
                        ]);
  } totalPrice(index){
orderDetail[0].price=myBagList[index].price;
orderDetail[1].price=(int.parse(myBagList[index].price!)*0.2).toString();
orderDetail[2].price='20\$';
orderDetail[3].price=(int.parse(myBagList[index].price!)*0.2+(20)).toString();
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


