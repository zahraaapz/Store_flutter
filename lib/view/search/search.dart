import 'package:appstore/color/color.dart';
import 'package:appstore/view/firstScreen/mainScreen.dart';


import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var select = 0;
  TextEditingController textEditingController=TextEditingController();
  List duplicate=List.generate(10, ((index) => 'item $index'));
  List item=[];



  @override
  void initState(){
    item=duplicate;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                      },
                      child: Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Rang.toosi,
                    ),
                    width: 300,
                    height: 50,
                    child: TextField(
                      controller: textEditingController,
                      onChanged: (value) {
                        searchBar(value);
                      },
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Rang.grey),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: item.length,
                shrinkWrap: true,
                itemBuilder:(context, index) {
                
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${item[index]}'),
                );
              },),
            )
          ],
        ),
      ),
    );
  }

searchBar(String s){

setState(() {
  item=duplicate.where((element) => element.toLowerCase().contains(s.toLowerCase())).toList();
});


}

}
