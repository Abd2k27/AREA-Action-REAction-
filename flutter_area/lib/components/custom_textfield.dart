import "package:flutter/material.dart";

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function(String value)? getValue;

  final TextEditingController? controller;
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.getValue,
    this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: getValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        hintText: hintText,
      ),
    );
  }
}
