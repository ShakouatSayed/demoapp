import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final Color prefixBgColor;
  final Color suffixColor;
  final TextInputType inputType;
  final ValueChanged<String> onAction;

  const InputBox({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.onAction,
    this.prefixBgColor = const Color(0xFF4A4648),
    this.suffixColor = const Color(0xFF6E8F72),
    this.inputType = TextInputType.text,
  });
  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {

  final TextEditingController _ctr = TextEditingController();

  @override
  void dispose(){
    _ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //Responsive Sizing
    final containerHeight = screenHeight * 0.075;
    final borderRadius = screenWidth * 0.03;
    final paddingVertical = screenHeight * 0.025;
    final prefixSize = screenWidth * 0.09;
    final preIconRadius = screenWidth * 0.015;
    final iconSize = screenWidth * 0.05;
    final prePadHor = screenWidth * 0.03;
    final preMinWid = screenWidth * 0.16;
    final sufPlasRad = screenWidth * 0.055;

    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.black12),
        boxShadow: const [BoxShadow(blurRadius: 4, offset: Offset(0, 1), color: Colors.black12)],
      ),
      child: TextField(
        controller: _ctr,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black45),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(vertical: paddingVertical),

            //Prefix Box
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: prePadHor),
            child: Container(
              width: prefixSize,
              height: prefixSize,
              decoration: BoxDecoration(
                color: widget.prefixBgColor,
                borderRadius: BorderRadius.circular(preIconRadius),
              ),
              child: Icon(widget.prefixIcon, color: Colors.white,size: iconSize),
            ),
          ),
          prefixIconConstraints:  BoxConstraints(minWidth: preMinWid),

          // Suffix Action Button
          suffixIcon: IconButton(
            onPressed: () => widget.onAction(_ctr.text.trim()), icon: Icon(widget.suffixIcon),
            color: widget.suffixColor,
            splashRadius: sufPlasRad,
          )
        ),
        onSubmitted: (v) => widget.onAction(v.trim()),
      ),
    );
  }
}
