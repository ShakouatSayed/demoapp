

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //Responsive Sizing
    final buttonHeight = screenHeight * 0.055;
    final borderRadiusOuter = screenWidth * 0.05;
    final borderRadiusInner = screenWidth * 0.015;
    final paddingHorizontal = screenWidth * 0.04;
    final iconSize = screenWidth * 0.05;
    final spacing = screenWidth * 0.025;
    final fontSize = screenWidth * 0.04;


    return SingleChildScrollView(
      child: SizedBox(
        height: buttonHeight,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadiusOuter),
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
              borderRadius: BorderRadius.circular(borderRadiusInner),
            ),
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Icon(Icons.check, color: Colors.white, size: iconSize),
                SizedBox(width: spacing),
                Text(
                  "New SALE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.6,
                    fontSize: fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
