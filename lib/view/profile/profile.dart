import 'dart:ui';

import 'package:appstore/color/color.dart';
import 'package:appstore/view/search/search.dart';

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('Profile',
                    style: TextStyle(
                        color: Rang.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 130,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Rang.grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   GestureDetector(
                    onTap: () {
                      
                    },
                     child: Container(
                   
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     image: DecorationImage(image: AssetImage('assets/image/avatar.png'))
                   ),child: Text('upload your pic'),
                      
                                 
                                     ),
                   ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Zahra Pirooz'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('6690400 996'),
                      ),
                      Text(
                        'zahrapirooo@jmnm.cpm',
                        style: TextStyle(color: Rang.greylight),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Rang.greylight,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Personal Informantion',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My Address Book',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My Saved Cards',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My Order', style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Refer and Earn',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Search())));
                    },
                    child: Icon(Icons.arrow_forward_ios_outlined))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.logout, color: Rang.blue),
                  Text(
                    'Log out',
                    style: TextStyle(color: Rang.blue),
                  )
                ]),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith(((states) {
                      return states.contains(MaterialState.pressed)
                          ? Rang.blue
                          : Colors.white;
                    })),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Rang.blue, width: 2))),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
