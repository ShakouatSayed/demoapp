import 'package:demoapp/foodMenuScreen/GrideIteam.dart';
import 'package:demoapp/ticketCart/TicketCard.dart';
import 'package:flutter/material.dart';
/*
class TicketAppBar extends StatelessWidget implements PreferredSizeWidget {
  TicketAppBar({super.key});
  //List<Map<String, dynamic>> cart = [];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text("Ticket"),
      leading: Builder(
        builder:
            (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
      ),
      /*
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


       */
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.receipt_long),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketCard(orders: GrideIteam.cart),
                  ),
                );
              },
            ),

            Positioned(
              right: 6,
              top: 8,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(minWidth: 18, minHeight: 18),
                child: Text(
                  "3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

 */
