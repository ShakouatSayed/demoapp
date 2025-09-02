

import 'package:demoapp/newUpdateCode/HomePage.dart';
import 'package:flutter/material.dart';

class DataClearButton extends StatelessWidget {
  final VoidCallback? onConfirm;
  final WidgetBuilder? homePageBuilder;

  const DataClearButton({
    super.key,
    required this.onConfirm,
    required this.homePageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () async {
          final confirmed =
              await showDialog<bool>(
                context: context,
                builder:
                    (_) => AlertDialog(
                      title: const Text("Confirm"),
                      content: const Text(
                        "Do you want to start new cell the previous remove all Data?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
              ) ??
              false;

          if (!confirmed) return;
          if (onConfirm != null) onConfirm!();
          final home = homePageBuilder?.call(context) ?? const HomePage();
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => home),
            (route) => false,
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF2E8B2e),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.check, color: Colors.white, size: 20),
              SizedBox(width: 10),
              Text(
                "New SALE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
