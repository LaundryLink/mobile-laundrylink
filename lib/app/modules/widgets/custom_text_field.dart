import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final IconData? iconVisible;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.iconVisible,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.058,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFF2F2F2),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Color(0xFFBDBDBD),
            fontSize: 14,
          ),
          suffixIcon: widget.iconVisible != null
              ? Icon(
                  widget.iconVisible,
                )
              : null,
        ),
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
