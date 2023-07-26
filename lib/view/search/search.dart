import 'package:appstore/color/color.dart';
import 'package:appstore/view/firstScreen/mainScreen.dart';


import 'package:flutter/material.dart';




class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  List<String> items = List.generate(20, ((index)=>'item $index'));
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems.addAll(items);
  }

  void filterItems(String query) {
    List<String> temp = [];
    temp.addAll(items);
    if (query.isNotEmpty) {
      temp.retainWhere((item) => item.toLowerCase().contains(query.toLowerCase()));
    }
    setState(() {
      filteredItems.clear();
      filteredItems.addAll(temp);
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
        title: Row(
                  children: [
                    const SizedBox(
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
                        child: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Rang.toosi,
                      ),
                      width: 300,
                      height: 50,
                      child: TextField(
                        controller: searchController,
                        onChanged: filterItems,
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: const TextStyle(color: Rang.grey),
                            suffixIcon: const Icon(
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
      body: ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(filteredItems[index]),
          );
        },
      ),
    );

  }
}

