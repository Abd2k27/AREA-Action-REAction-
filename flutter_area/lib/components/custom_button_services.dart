import "package:flutter/material.dart";

class CustomButtonServices extends StatelessWidget {
  final Function() connect;
  final String hintText;
  const CustomButtonServices(
      {Key? key, required this.hintText, required this.connect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            ElevatedButton(
                onPressed: () {},
                child: Text(hintText),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(width: maxWidth * .1,),
            Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: ElevatedButton(
                    onPressed: connect,
                    child: Text("Activate"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))))),
          ]),
        ),
      ),
    );
  }
}
