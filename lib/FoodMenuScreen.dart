import 'package:demoapp/FilterSearchBox.dart';
import 'package:demoapp/HomeHeader.dart';
import 'package:flutter/material.dart';
import 'GrideIteam.dart';
import 'TickChargeBar.dart';

class FoodMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
        title: Row(
          children: [
            Text("Ticket"),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.green,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "3",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      drawer: Drawer(),

      body: Column(
        children: [
          // Open ticket banner
          //HomeHeader(),

          // ticket charge bar
          SizedBox(width: 8),
          TickChargeBar(),

          // filter + search
          FilterSearchBox(),

          // Grid Iteam
          GrideIteam(),
        ],
      ),
    );
  }
}
