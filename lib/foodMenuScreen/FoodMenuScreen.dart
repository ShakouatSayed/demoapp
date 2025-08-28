import 'package:demoapp/foodMenuScreen/FilterSearchBox.dart';
import 'package:demoapp/foodMenuScreen/HomeHeader.dart';
import 'package:demoapp/foodMenuScreen/TicketAppBar.dart';
import 'package:demoapp/newUpdateCode/ProductAppBar.dart';
import 'package:flutter/material.dart';
import 'GrideIteam.dart';
import 'TickChargeBar.dart';

class FoodMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: TicketAppBar(),
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
