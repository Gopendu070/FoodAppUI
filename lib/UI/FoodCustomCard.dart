import 'package:flutter/material.dart';

class FoodCustomCard extends StatelessWidget {
  List foodList;
  int index;
  FoodCustomCard({required this.foodList, required this.index});

  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 2.4,
      shadowColor: Color.fromARGB(108, 255, 255, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Container(
        height: Height * 0.33,
        child: Column(
          children: [
            SizedBox(height: 8),
            Container(
                height: 115,
                width: 115,
                child: Image.asset(
                  foodList[index - 1]["img"],
                  fit: BoxFit.fitWidth,
                )),
            SizedBox(height: 8),
            //Name of food
            Text(
              foodList[index - 1]["name"],
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 8),
            //Description
            Text(
              foodList[index - 1]["description"],
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 8),
            //Calori count
            Text(
              "🔥 " + foodList[index - 1]["calories"] + " Calories",
              style: TextStyle(color: Colors.redAccent),
            ),
            SizedBox(height: 10),
            //Price
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$ ",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
                Text(
                  foodList[index - 1]["price"],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
