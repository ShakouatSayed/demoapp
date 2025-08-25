import 'package:flutter/material.dart';

class FilterSearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),

      child: Row(
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
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ),

          SizedBox(width: 8),
          //Filter Icom
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(
              onPressed: () {
                //handel filter
              },
              icon: Icon(Icons.filter_alt),
            ),
          ),

          SizedBox(width: 8),
          //search Icon Button
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(
              onPressed: () {
                //handel search
              },
              icon: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}
