import 'package:explore/components/custom_button.dart';
import 'package:explore/components/custom_textfield.dart';
import "package:flutter/material.dart";

class HeadTitle extends StatelessWidget {
  const HeadTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: maxWidth * (1 / 30), vertical: 20),
          child: Text(
            "AREA",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
