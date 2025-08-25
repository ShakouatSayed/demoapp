import 'package:flutter/material.dart';

class TickChargeBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      // foregroundDecoration: BoxDecoration(
      //   border: Border.all(color: Colors.white),
      //   color: Colors.green,
      //   borderRadius: BorderRadius.circular(6),
      // ),

      //decoration: ,
      //color: Colors.green,
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Text(
            "Open TICKETS",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            "CHARGE TK 0.0",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}