import 'dart:ffi';

import 'package:flutter/material.dart';

class FilterSearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(5),
            ),
            padding:  EdgeInsets.all(4),
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

                    decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                     ),
                  ),
                ),

                SizedBox(width: 20),
                _iconBox(Icons.qr_code_scanner_rounded,(){}),
                SizedBox(width: 10),
                _iconBox(Icons.search,(){}),
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

  Widget _iconBox(IconData icon,VoidCallback onTap){
    return Container(
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(icon: Icon(icon),onPressed: onTap),
    );
  }
}
