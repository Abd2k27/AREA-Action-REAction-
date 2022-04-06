import "package:flutter/material.dart";

class CustomButton extends StatelessWidget {
  final Function () action; 
  final Widget content;
  const CustomButton({Key? key, required this.action, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: action, child: content, 
    style: ElevatedButton.styleFrom(
      primary: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      )
    ),);
  }
}