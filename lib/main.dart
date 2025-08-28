import 'package:flutter/material.dart';

import 'foodMenuScreen/FoodMenuScreen.dart';
import 'newUpdateCode/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      //color: Colors.white,
      home: HomePage(),
    );
  }
}
