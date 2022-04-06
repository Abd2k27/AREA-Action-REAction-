import 'package:explore/components/custom_services_popup.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";

import '../../components/headerBack.dart';
import '../account_view.dart';
import '../home_page.dart';

class ImageService extends StatefulWidget {
  const ImageService({Key? key}) : super(key: key);

  @override
  _ImageServiceState createState() => _ImageServiceState();
}

class _ImageServiceState extends State<ImageService> {
  String url = "";
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderBack(
              appletsFun: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => HomePage()))),
              accountFun: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => AccountPage()))),
              serciceFun: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => ServicesPage()))),
            ),
            SizedBox(
              height: maxHeight * (1 / 30),
            ),
            Center(
                child: Text(
              "Lorem Picsum",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )),
            SizedBox(width: maxWidth * .4, child: Divider()),
            SizedBox(
              height: 27,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomServicesPopUp(
                  services: "",
                  action: () {
                  },
                  hintext: "An inspiring image",
                  stateButton: "Connect",
                  col: Color.fromARGB(255, 117, 153, 215),
                  connect: () async {
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
