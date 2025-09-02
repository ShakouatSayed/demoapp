import 'package:flutter/material.dart';

class TickChargeBar extends StatelessWidget{
  final double total;
  const TickChargeBar({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 12),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding:  EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: (){
                      },
                      child: Text("Open TICKETS",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Charge", style: TextStyle(color: Colors.white, fontSize: 16)),
                          Text("Tk ${total.toStringAsFixed(2)}", style: TextStyle(color: Colors.white)),
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