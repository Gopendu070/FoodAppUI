import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kudosware/UI/FoodCustomCard.dart';
import 'package:kudosware/utils/Utils.dart';

class SearchFoodScreen extends StatefulWidget {
  const SearchFoodScreen({super.key});

  @override
  State<SearchFoodScreen> createState() => _SearchFoodScreenState();
}

class _SearchFoodScreenState extends State<SearchFoodScreen> {
  List foodList = [];
  Future<void> readFoodData() async {
    String response = await rootBundle.loadString("lib/asset/foods.json");
    final data = await jsonDecode(response);
    setState(() {
      foodList = data["foods"];
    });
    print(foodList.length);
  }

  @override
  void initState() {
    super.initState();
    readFoodData();
  }

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              readFoodData();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        title: const Text(
          "Search Food",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber[600]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "lib/asset/image/user.png",
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: "Spice Food",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          suffix: GestureDetector(
                            onTap: () {
                              searchController.clear();
                            },
                            child: Icon(
                              Icons.clear,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 3),
                              borderRadius: BorderRadius.circular(50))),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.amber[400],
                          borderRadius: BorderRadius.circular(13)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                            onTap: () {}, child: Icon(Icons.tune)),
                      ))
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: foodList.length + 1,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              child: Text(
                                "Found \n80 results",
                                style: Utils.boldTxt,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: FoodCustomCard(
                                foodList: foodList, index: index));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
