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
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
        boxShadow: const [BoxShadow(blurRadius: 4, offset: Offset(0, 1), color: Colors.black12)],
      ),
      child: TextField(
        controller: _ctr,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black45),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(vertical: 18),

            //Prefix Box
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: widget.prefixBgColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(widget.prefixIcon, color: Colors.white,size: 20),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 64),

          // Suffix Action Button
          suffixIcon: IconButton(
            onPressed: () => widget.onAction(_ctr.text.trim()), icon: Icon(widget.suffixIcon),
            color: widget.suffixColor,
            splashRadius: 22,
          )
        ),
        onSubmitted: (v) => widget.onAction(v.trim()),
      ),
    );
  }
}
