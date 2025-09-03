import 'package:flutter/material.dart';

class TickChargeBar extends StatelessWidget{
  final double total;
  const TickChargeBar({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive sizing
    final sizeBoxHeight = screenHeight * 0.015;
    final horizontalPadding = screenWidth * 0.03;
    final verticalPadding = screenHeight * 0.01;
    final containerPadding = screenWidth * 0.03;
    final borderRadius = screenWidth * 0.015;
    final fontSizeMediam = screenWidth * 0.04;
    final fontSizeSmall = screenWidth * 0.035;


    return Column(
        children: [
          SizedBox(height: sizeBoxHeight),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                padding:  EdgeInsets.all(containerPadding),
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: (){
                      },
                      child: Text("Open TICKETS",
                        style: TextStyle(color: Colors.white, fontSize: fontSizeMediam),
                      ),
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Charge", style: TextStyle(color: Colors.white, fontSize: fontSizeMediam)),
                          Text("Tk ${total.toStringAsFixed(2)}", style: TextStyle(color: Colors.white, fontSize: fontSizeSmall)),
                        ],
                      ),

                  ],
                ),
              ),
          )
        ],
      );
  }
}