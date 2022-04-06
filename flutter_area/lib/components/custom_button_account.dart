import "package:flutter/material.dart";

class CustomButtonAccount extends StatelessWidget {
  final String hintext;
  const CustomButtonAccount({Key? key, required this.hintext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), 
      border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20,),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          Text(hintext),
           SizedBox(width: maxWidth * .2,),
          ]
        ),
      ),
      ),
    );
  }
}