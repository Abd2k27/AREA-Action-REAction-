import "package:flutter/material.dart";

class CustomInfo extends StatelessWidget {
  final String hintext;
  const CustomInfo({ Key? key, required this.hintext, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(hintext, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),),
        SizedBox(width: maxWidth * .4, child: Divider()),
      ]),
    );
  }
}