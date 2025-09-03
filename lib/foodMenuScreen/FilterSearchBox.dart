//import 'dart:ffi';

import 'package:flutter/material.dart';

class FilterSearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive Sizing
    final horPad = screenWidth * 0.03;
    final verPad = screenHeight * 0.01;
    final conPad = screenWidth * 0.01;
    final borRad = screenWidth * 0.015;
    final dropConPad = screenWidth * 0.02;
    final sizeBoxLar = screenWidth * 0.05;
    final sizeBoxSam = screenWidth * 0.025;
    final iconBotRad = screenWidth * 0.012;
    final iconSize = screenWidth * 0.06;

    return Column(
      children: [
        //SizedBox(height: 4),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horPad, vertical: verPad),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(borRad),
            ),
            padding:  EdgeInsets.all(conPad),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: "All Iteams",
                    items:
                    ["All Iteams", "Snacks", "Drinks"]
                        .map((e) => DropdownMenuItem(child: Text(e), value: e))
                        .toList(),
                    onChanged: (val) {},

                    decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: dropConPad),
                     ),
                  ),
                ),

                SizedBox(width: sizeBoxLar),
                _iconBox(Icons.qr_code_scanner_rounded,(){}, iconBotRad, iconSize),
                SizedBox(width: sizeBoxSam),
                _iconBox(Icons.search,(){}, iconBotRad, iconSize),
                /*
                //Filter Icom
                Container(
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: IconButton(
                    onPressed: () {
                      //handel filter
                    },
                    icon: Icon(Icons.qr_code_scanner_rounded,),
                  ),
                ),


                //search Icon Button
                Container(
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: IconButton(
                    onPressed: () {
                      //handel search
                    },
                    icon: Icon(Icons.search),
                  ),
                ),

                 */
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _iconBox(IconData icon,VoidCallback onTap, double borderRadius, double iconSize){
    return Container(
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: IconButton(icon: Icon(icon, size: iconSize,),onPressed: onTap),
    );
  }
}
