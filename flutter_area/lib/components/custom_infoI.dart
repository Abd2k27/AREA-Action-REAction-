import 'package:explore/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'custom_textfield.dart';

class CustomInfoI extends StatefulWidget {
  final String hintext;
  final String info;
  final Function() request;
  const CustomInfoI(
      {Key? key,
      required this.hintext,
      required this.info,
      required this.request})
      : super(key: key);

  @override
  _CustomInfoIState createState() => _CustomInfoIState();
}

class _CustomInfoIState extends State<CustomInfoI> {
  final _formKey = GlobalKey<FormState>();
  String choice = "";
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          widget.hintext,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        SizedBox(width: maxWidth * .4, child: Divider()),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.info,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 17,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: maxWidth * .1,
          child: Column(
            children: [
              CustomTextField(
                hintText: "Choice...",
                getValue: (String value) {
                  setState(() {
                    choice = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                  action: () {
                    if (_formKey.currentState!.validate()) {
                      print(choice);
                      GestureDetector(onTap: widget.request,);
                    }
                  },
                  content: Text(
                    "Done",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
