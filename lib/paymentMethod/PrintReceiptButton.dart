import 'package:flutter/material.dart';

class PrintReceiptButton extends StatelessWidget{
  final VoidCallback onPressed;
  const PrintReceiptButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.03),
      ),
      height: size.height * 0.06,
      child: ElevatedButton.icon(
          onPressed: onPressed,
        icon: Icon(Icons.print, size: size.width * 0.06),
        label: Text("PRINT RECEPIT", style: TextStyle(fontSize: size.width * 0.04, fontWeight: FontWeight.w600)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.black87,
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(size.width * 0.03)),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.015),
        ),
      ),
    );
  }
}