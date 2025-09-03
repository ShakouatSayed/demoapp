import 'package:flutter/material.dart';

class ProductAppBar extends StatelessWidget implements PreferredSizeWidget{
  final int cartCount;
  final VoidCallback onCartPressed;

  const ProductAppBar({super.key, required this.cartCount, required this.onCartPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive sizing
    final padding = screenWidth * 0.015;
    final fontSize = screenWidth * 0.035;
    final borderRadius = screenWidth * 0.03;
    final right = screenWidth * 0.015;
    final top = screenHeight * 0.015;

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
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon:const Icon(Icons.receipt_long),
              onPressed: onCartPressed),
            if(cartCount > 0)
              Positioned(
              right: right,
              top: top,
              child: Container(
                padding: EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                constraints: BoxConstraints(minWidth: screenWidth * 0.045, minHeight: screenWidth * 0.045),
                child: Text(
                  "$cartCount",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}