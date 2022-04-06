import 'package:explore/components/custom_services_popup.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";

import '../../components/headerBack.dart';
import '../account_view.dart';
import '../home_page.dart';
import '../../main.dart';

class GmailService extends StatefulWidget {
  GmailService({Key? key}) : super(key: key);

  @override
  State<GmailService> createState() => _GmailServiceState();
}

class _GmailServiceState extends State<GmailService> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
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
              "Gmail",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(width: maxWidth * .4, child: Divider()),
          SizedBox(
            height: 27,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                services: "[Movies & Gmail]",
                action: () {},
                hintext: "Send an email with the top movies every week. ",
                stateButton: "Connect",
                col: Colors.red,
                connect: () {
                  gm1 = true;
                },
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "[Weather & Gmail]",
                action: () {},
                hintext: "Receive weather info every morning.",
                stateButton: "Connect",
                col: Colors.red,
                connect: () {
                  gm2 = true;
                },
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "[Movies & Gmail]",
                action: () {},
                hintext: "Receive latest movies informations every week.",
                stateButton: "Connect",
                col: Colors.red,
                connect: () {
                  gm2 = true;
                },
              ),
            ],
          )
        ],
      ),
    ));
  }
}
