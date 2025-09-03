import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final double total;
  final VoidCallback onSave;
  const BottomBar({super.key, required this.total, required this.onSave});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablate = screenWidth > 600;

    return SafeArea(
      minimum: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.03),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: isTablate? 28 : 16, vertical: isTablate ? 18 : 12),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(isTablate ? 30 : 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onSave,
              child: Text(
                "Save",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white12,
                  fontSize: isTablate ? 22 : 16,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Charge",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isTablate ? 18 : 14,
                  ),
                ),
                Text("Tk ${total.toStringAsFixed(2)}", style: TextStyle(color: Colors.white, fontSize: isTablate ? 20 :  16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
