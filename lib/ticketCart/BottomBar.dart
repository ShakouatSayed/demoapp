import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget{
  final double total;
  final VoidCallback onSave;
  const BottomBar({super.key, required this.total, required this.onSave});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(bottom: 20, left: 12, right: 12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onSave,
              child: const Text("Save", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white12)),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Charge", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("Tk $total", style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}