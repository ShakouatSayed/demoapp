import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final double cost;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.cost,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final padding = screenWidth * 0.025;
    //final cardHeight = screenHeight * 0.3;
    //final imageHeight = cardHeight * 0.65;
    final borderRadius = screenWidth * 0.025;
    final fontSizeTitle = screenWidth * 0.045;
    final fontSizeCost = screenWidth * 0.04;
    final spacing = screenHeight * 0.005;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(borderRadius)),
                  child: Image.asset(image, fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSizeTitle), textAlign: TextAlign.center),
                  SizedBox(height: spacing),
                  Text("$cost", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500, fontSize: fontSizeCost)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
