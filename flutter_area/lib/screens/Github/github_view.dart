import 'package:explore/components/custom_services_popup.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import "../../main.dart";
import '../../components/headerBack.dart';
import '../account_view.dart';
import '../home_page.dart';

class GithubService extends StatefulWidget {
  GithubService({Key? key}) : super(key: key);

  @override
  State<GithubService> createState() => _GithubServiceState();
}

class _GithubServiceState extends State<GithubService> {
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
            "Github",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          )),
          SizedBox(width: maxWidth * .4, child: Divider()),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                services: "",
                action: () {
                },
                hintext: "Get notification when new issue is added.",
                stateButton: "Connect",
                col: Colors.black,
                connect: () {
                  gi1 = true;
                },
              ),
              SizedBox(
                width: maxWidth * (1 / 100),
              ),
              CustomServicesPopUp(
                services: "",
                action: () {
                },
                hintext:
                    "Receive a Mail when new repository created by a specific user.",
                stateButton: "Connect",
                col: Colors.black,
                connect: () {
                  gi2 = true;
                },
              ),
              SizedBox(
                width: maxWidth * (1 / 100),
              ),
              CustomServicesPopUp(
                services: "",
                action: () {
                },
                hintext: "get all commits for a specified repo.",
                stateButton: "Connect",
                col: Colors.black,
                connect: () {
                  gi3 = true;
                },
              ),
            ],
          )
        ],
      ),
    ));
  }
}
