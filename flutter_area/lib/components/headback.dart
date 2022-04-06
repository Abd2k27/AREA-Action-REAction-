import 'package:explore/components/custom_button.dart';
import 'package:explore/components/custom_textfield.dart';
import "package:flutter/material.dart";

class HeadBack extends StatelessWidget {
  const HeadBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: maxWidth * (1 / 30), vertical: 20),
          child: Column(
            children: [
              Text(
                "AREA",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: maxHeight * (1/100),
              ),
              CustomButton(
                  action: () {
                    Navigator.of(context).pop();
                  },
                  content: Text(
                    "Back",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ));
  }
}
