import 'package:appstore/controller/homeScreenController.dart';
import 'package:appstore/view/firstScreen/expandable.dart';
import 'package:appstore/model/Model.dart';
import 'package:appstore/color/color.dart';
import 'package:appstore/view/search/search.dart';


import 'package:appstore/view/selectType/select_kala.dart';

import 'package:get/get.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Extractmainscreen extends StatelessWidget {


 HomeScreenController homeScreenController=Get.put(HomeScreenController());
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  RxInt  select=0.obs;
 
 
  Extractmainscreen({super.key});





  @override
  Widget build(BuildContext context) {
      RxList<RxBool> fav = RxList.generate(3,(index) => false.obs);
    var size = MediaQuery.of(context).size;
    homeScreenController.getHomeItem();
 
    return SafeArea(
      child: Scaffold(
          key: _key,
          backgroundColor: Colors.white,
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Rang.toosi,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                'assets/avatar.png',
                              ),
                            ),
                          ),
                          Text('zahra pirooz'),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Top Categories',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: Model.modelList.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: GestureDetector(
                                child: Text(Model.modelList[index].title,
                                    style: const TextStyle(
                                        color: Rang.blue, fontSize: 15)),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) => Select_kala(
                                            select: index,homeScreenController: homeScreenController,
                                          ))));
                                },
                              ),
                            );
                          })),
                    ),
                    const Text('Contact us',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      child: const Text('Help & Support',
                          style: TextStyle(color: Rang.blue)),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      child: const Text('Wishlist',
                          style: TextStyle(color: Rang.blue)),
                      // onTap: () {
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //       builder: ((context) =>
                      //           Wish(fav, suggestList, select))));
                      // },
                    ),
                  ]),
            ),
          ),
          body: Stack(children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(children: [
                ////App Bar
                Row(
                  children: [
                    SizedBox(
                      width: 90,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              _key.currentState?.openDrawer();
                            },
                            child: const Icon(
                              Icons.menu,
                              color: Rang.blue,
                              size: 32,
                            ),
                          ),
                          const Text(' Home',
                              style: TextStyle(
                                  color: Rang.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 121,
                    ),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.add_to_photos_rounded,
                                color: Rang.blue),
                            InkWell(
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Search(),
                                      ));
                                }),
                                child:
                                    const Icon(Icons.search, color: Rang.blue)),
                            const Icon(Icons.notifications_none,
                                color: Rang.blue)
                          ]),
                    )
                  ],
                ),

                ///Bannner
                const Bannner(),

                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Top Categories',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                ////type list
                typeList(size),

                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('New Arrivals',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                            child: InkWell(
                          child: Row(
                            children: [
                              Text(
                                'View all',
                                style: TextStyle(color: Rang.blue),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Rang.blue,
                                size: 15,
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                //////suggest List
                suggList(size,fav),
                Container(
                  ///collection container
                  color: Rang.blue,
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Handpicked Collections',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        CollectionList(),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shop by Brands',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              'View all',
                              style: TextStyle(color: Rang.blue),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Rang.blue,
                              size: 15,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Brand(),
                    ],
                  ),
                ),
                Shortcut(size: size),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 8, top: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Makeup & Skincare',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ]),
                ),
                Container(
                  width: size.width / 1.12,
                  height: size.height / 5.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('assets/makeup.png').image)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 8),
                  child: Row(children: [
                    Container(
                      width: size.width / 2.3,
                      height: size.height / 5.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset('assets/skincare.png').image)),
                    ),
                    Container(
                      width: size.width / 2.2,
                      height: size.height / 5.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  Image.asset('assets/facepacks.png').image)),
                    )
                  ]),
                ),
                const Expandablee(),

                ///expandble box
                const SizedBox(
                  height: 30,
                )
              ]),
            ),
          ])),
    );
  }

SizedBox typeList(Size size) {//seslect clothes or...
   
     return  SizedBox(
         //sizedbox main
         height: size.height / 6.6,
         width: double.infinity,
         child:
          ListView.builder(
               scrollDirection: Axis.horizontal,
               physics: const BouncingScrollPhysics(),
               itemCount: Model.modelList.length,
               itemBuilder: ((context, index) {
                 return Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         children: [
                         
                             InkWell(
                                 onTap: () {
                                
                                     select.value = index;
                                  
                                 
                                   Navigator.of(context).push(MaterialPageRoute(
                                       builder: (context) => 
                                          Select_kala(
                                               select: index,homeScreenController: homeScreenController,
                                             ),
                                       ));
                                 },
                                 child: Container(
                                   //list container
                                   width: 60,
                                   height: 65,
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
                               style: const TextStyle(
                                   fontSize: 14, fontWeight: FontWeight.bold),
                             ),
                           )
                         ],
                       ),
                     ),
                   
                 ]);
               }
         
       
          
         )),
     );
  }

SizedBox  suggList(size,fav) {//suggestion List
  
      return SizedBox(
        height: size.height / 4.2,
        width: double.infinity,
        child:  Obx(()=>ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeScreenController.suggestlist.length,
                  itemBuilder: (context, index) {
                   return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: ((context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Container(
                                    ////bottomsheet container
                                    height: size.height / 2.2,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            topRight: Radius.circular(45))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 120,
                                                  height: 115,
                                                  decoration: BoxDecoration(
                                                      
                                                      borderRadius:
                                                          BorderRadius.circular(15),
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: Image.asset(
                                                            homeScreenController.suggestlist[index].ima!,
                                                          ).image)),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text( homeScreenController.suggestlist[index].brand!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold)),
                                                    const SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text(
                                                      homeScreenController.suggestlist[index].name!,
                                                      style: const TextStyle(
                                                        color: Rang.toosi,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text(
                                                        '${homeScreenController.suggestlist[index].price}\$',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold)),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 60,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: Rang.toosi,
                                                      borderRadius:
                                                          BorderRadius.circular(10)),
                                                  child: const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Text('4.5'),
                                                      Icon(
                                                        CupertinoIcons.star_fill,
                                                        color: Rang.orange,
                                                        size: 17,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Average Rating',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      '43 Ratings & 23 Reviews',
                                                      style: TextStyle(
                                                        color: Rang.greylight,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          //////filter
                                         homeScreenController.suggestlist[index].filter == 'shoes'
                                              ? Column(
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Select Size',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight.bold),
                                                          ),
                                                          Text(
                                                            ' (Uk Size)',
                                                            style: TextStyle(
                                                                color: Rang.grey),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    ////size pa
                                                    SizedBox(
                                                      height: 55,
                                                      child: ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: sizepa.length,
                                                          itemBuilder:
                                                              ((context, index) {
                                                          return
                                                             Padding(
                                                                padding:
                                                                    const EdgeInsets.all(
                                                                        2.0),
                                                                child: 
                                                                  InkWell(
                                                                    onTap: () {
                                                                     
                                                                        select.value = index;
                                                                     
                                                                    },
                                                                    child:
                                                                      AnimatedContainer(
                                                                      height: 80,
                                                                      width: 50,
                                                                      decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                              color: Rang
                                                                                  .blue),
                                                                          color: select ==
                                                                                  index
                                                                              ? const Color
                                                                                      .fromARGB(
                                                                                  82,
                                                                                  61,
                                                                                  123,
                                                                                  159)
                                                                              : Colors
                                                                                  .white,
                                                                          borderRadius:
                                                                              BorderRadius
                                                                                  .circular(
                                                                                      45)),
                                                                      duration:
                                                                          const Duration(
                                                                              milliseconds:
                                                                                  200),
                                                                      child: Center(
                                                                        child: Text(sizepa[
                                                                                index]
                                                                            .toString()),
                                                                      ),
                                                                   
                                                                                                                             
                                                                                                                            ),
                                                                ),
                                                            );
                                                          })),
                                                    ),
                                                  ],
                                                )
                                              : const SizedBox(
                                                  height: 30,
                                                ),
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.qr_code_scanner,
                                                  color: Rang.blue,
                                                  size: 40,
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                ElevatedButton(
                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty
                                                            .all(RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(10))),
                                                        backgroundColor:
                                                            MaterialStateProperty.all(
                                                                Rang.blue)),
                                                    onPressed: () {
                                                      if(!myBagList.contains(homeScreenController.suggestlist[index]))
                                                      myBagList.add(homeScreenController.suggestlist[index]);
                                                    },
                                                    child: const SizedBox(
                                                      width: 270,
                                                      height: 50,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.center,
                                                        children: [
                                                          Icon(Icons
                                                              .shopping_bag_outlined),
                                                          Text('Add to Bags')
                                                        ],
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ); ////bottomsheet container
                                },
                              );
                            }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              ////container suggestlist
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(13),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: Image.asset(
                                        homeScreenController.suggestlist[index].ima!,
                                      ).image)),
                              height: size.height / 9,
                              width: size.width / 3.5,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 30,
                              width: 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  
                                  Text( homeScreenController.suggestlist[index].brand!,
                                      style:
                                          const TextStyle(fontWeight: FontWeight.bold)),
                                  InkWell(
                                    onTap:() {

                                    
                                     
                                      fav[index].value =! fav[index].value;

                                      if(fav[index].value==true && !wishList.contains(homeScreenController.suggestlist[index])){

                                        wishList.add(homeScreenController.suggestlist[index]);
                                      }if(fav[index].value==false && wishList.contains(homeScreenController.suggestlist[index])){

                                          wishList.remove(homeScreenController.suggestlist[index]);
                                      }
                             debugPrint(wishList.length.toString()) ;  
                                 },
                                    child: Obx(()=>
                                     Icon(
                                        fav[index].value ==false
                                            ? Icons.favorite_border
                                            : Icons.favorite,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0, bottom: 3),
                              child: Text( homeScreenController.suggestlist[index].name!,
                                  style: const TextStyle(
                                    color: Rang.greylight,
                                  )),
                            ),
                            Text("${ homeScreenController.suggestlist[index].price}\$",
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    
                  );}),
              ),
           
        
      );
  
  }
}

class Shortcut extends StatelessWidget {
  const Shortcut({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: size.width / 1.12,
          height: size.height / 4.7,
          decoration: BoxDecoration(
              color: Rang.blue, borderRadius: BorderRadius.circular(10)),
        ),
      ),
      Positioned(
        left: 20,
        top: 40,
        child: Row(
          children: [
            Container(
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/PWA-CTA.png',
                      )),
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(width: 8),
            const SizedBox(
              width: 200,
              child: Text(
                '''Discover your favrouite products faster with CORA’L web app.''',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      const Positioned(
          left: 150,
          top: 50,
          child: Text(
            '',
            style: TextStyle(color: Colors.white),
          )),
      Positioned(
        bottom: 20,
        left: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Add shortcut ', style: TextStyle(color: Colors.white)),
            Icon(Icons.arrow_forward, color: Colors.white)
          ],
        ),
      )
    ]);
  }
}

class Brand extends StatelessWidget {
  const Brand({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: brands.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(brands[index].ima))),
              width: 80,
              height: 80,
            ),
          );
        }));
  }
}

class CollectionList extends StatelessWidget {
  const CollectionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

        ///collection
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1, crossAxisCount: 2),
        itemCount: cateList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              width: 120,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(cateList[index].ima)),
              ),
            ),
          );
        });
  }
}

class Bannner extends StatelessWidget {
  const Bannner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            Image.asset('assets/spring.png'),
            Image.asset('assets/banner.png'),
          ],
        ));
  }
}
