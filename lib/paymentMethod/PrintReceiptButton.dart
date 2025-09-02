import 'package:flutter/material.dart';

class PrintReceiptButton extends StatelessWidget{
  final VoidCallback onPressed;
  const PrintReceiptButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      height: 50,
      child: ElevatedButton.icon(
          onPressed: onPressed,
        icon: const Icon(Icons.print, size: 24),
        label: const Text("PRINT RECEPIT", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.black87,
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}