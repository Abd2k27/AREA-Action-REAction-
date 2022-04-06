import "package:flutter/material.dart";

class CustomServicesPopUp extends StatefulWidget {
  final String services;
  final Function() action;
  final String hintext;
  final String stateButton;
  final Color col;
  final Function() connect;
  const CustomServicesPopUp(
      {Key? key,
      required this.services,
      required this.action,
      required this.hintext,
      required this.stateButton,
      required this.col,
      required this.connect})
      : super(key: key);

  @override
  State<CustomServicesPopUp> createState() => _CustomServicesPopUpState();
}

class _CustomServicesPopUpState extends State<CustomServicesPopUp> {
  bool isSwitched = false;
  String stateText = "Connect";
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * (0.8)),
        child: SizedBox(
            height: maxHeight * (1 / 2),
            width: maxWidth * (1 / 3),
            child: Card(
              color: widget.col,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.services,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: GestureDetector(
                        onTap: widget.action,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * (0.8)),
                          child: Text(
                            widget.hintext,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Switch(
                          value: isSwitched,
                          onChanged: (bool value) {
                            if (value) {
                              widget.connect();
                            }
                            isSwitched = value;
                            setState(() {});
                          }),
                    ],
                  ),
                  Text(isSwitched ? widget.stateButton : "Disconnect",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            )),
      ),
    );
  }
}
