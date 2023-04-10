import 'package:appstore/color/color.dart';
import 'package:appstore/model/Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class address extends StatefulWidget{
  @override
  State<address> createState() => _addressState();
}

class _addressState extends State<address> {
  int select=0;
  @override

  Widget build(BuildContext context) {
return SafeArea(
  child:   Scaffold(
  
    backgroundColor: Colors.white,
  
    body: Padding(
  
      padding: const EdgeInsets.all(8.0),
  
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
        
          Row(children: [
        
            Icon(Icons.arrow_back_ios,color: Rang.blue,size: 20,),
        
        
         SizedBox(width: 9,)
            ,Text('Add New Address',style:TextStyle(color: Rang.blue,fontSize: 20,fontWeight: FontWeight.bold) ,)
        
          ],),
          SizedBox(height: 9,),
        
          Text('Contact Information',style:TextStyle(fontSize: 16)),
        
          Divider(
        
            thickness: 1,color: Rang.grey,endIndent: 5,indent:5 ,
        
          ),       Container(
        
              height: 50,
        
              width: double.infinity,
        
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Rang.toosi ),
        
              child: TextField(
        
                decoration: InputDecoration(
          hintText: 'Full name',
        helperStyle: TextStyle(color: Rang.grey),
                  border: OutlineInputBorder(borderSide:BorderSide.none,borderRadius: BorderRadius.circular(15)),
        
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Rang.toosi),borderRadius: BorderRadius.circular(15))
        
                ),
        
              ),
        
            ),
            SizedBox(height: 15,),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
        
          
        
            Container(
        
              height: 50,
        
              width: 50,
        
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Rang.toosi ),
        
              child: TextField(
        keyboardType: TextInputType.number,
                decoration: InputDecoration(
          hintText: '49',
        helperStyle: TextStyle(color: Rang.grey),
                  border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
        
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Rang.toosi),borderRadius: BorderRadius.circular(15))
        
                ),
        
              ),
        
            ),
      
        
                   Container(
        
              height: 50,
        
              width: 340,
        
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Rang.toosi ),
        
              child: TextField(
        
                decoration: InputDecoration(
        hintText: 'Contact number',
        helperStyle: TextStyle(color: Rang.grey),
                  border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
        
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Rang.toosi),borderRadius: BorderRadius.circular(15))
        
                ),
        
              ),
        
            )
        
          ],),
          SizedBox(height: 120,),
                  Text('Delivery Address',style:TextStyle(fontSize: 16)),
        
          Divider(
        
            thickness: 1,color: Rang.grey,endIndent: 5,indent:5 ,
        
          ),
      
               Container(
        
              height: 50,
        
              width: double.infinity,
        
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Rang.toosi ),
        
              child: TextField(
        
                decoration: InputDecoration(
        hintText: 'Pin code',
        helperStyle: TextStyle(color: Rang.grey),
                  border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
        
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Rang.toosi),borderRadius: BorderRadius.circular(15))
        
                ),
        
              ),
        
            )  ,
            SizedBox(height: 15,)  ,      Container(
        
              height: 50,
        
              width: double.infinity,
        
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Rang.toosi ),
        
              child: TextField(
        
                decoration: InputDecoration(
        hintText: 'Street Address',
        helperStyle: TextStyle(color: Rang.grey),
                  border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
        
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Rang.toosi),borderRadius: BorderRadius.circular(15))
        
                ),
        
              ),
        
            )   ,     SizedBox(height: 15,)  ,      Container(
        
              height: 50,
        
              width: double.infinity,
        
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Rang.toosi ),
        
              child: TextField(
        
                decoration: InputDecoration(
        hintText: 'City',
        helperStyle: TextStyle(color: Rang.grey),
                  border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
        
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Rang.toosi),borderRadius: BorderRadius.circular(15))
        
                ),
        
              ),
        
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
              itemCount: 3,
                    itemBuilder: (BuildContext context, int index) { 
              return        Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      select=index;
                    });
                  },
                  child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          color: select==index?Rang.blue:Rang.toosi,
                          borderRadius: BorderRadius.circular(15)
                        ),
                    child: Center(child: Text(addresslist[index],style: TextStyle(color: select==index?Colors.white:Rang.grey),)),  ),
                ),
              );
                     },
                
              ),
            ),
            SizedBox(height: 20,)
,            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(onPressed: () {  },
              style: ButtonStyle(
             side: MaterialStateProperty.all(BorderSide()),
                backgroundColor: MaterialStateProperty.all(Rang.blue)),
              child:Text('Save Address') ,),
            )
        
        ]),
      ),
  
    ),
  
  ),
);
  }
}