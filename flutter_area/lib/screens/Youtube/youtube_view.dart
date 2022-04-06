import 'package:explore/components/custom_services_popup.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import '../../components/headerBack.dart';
import '../account_view.dart';
import '../home_page.dart';

class YoutubeService extends StatefulWidget {
  const YoutubeService({Key? key}) : super(key: key);

  @override
  _YoutubeServiceState createState() => _YoutubeServiceState();
}

class _YoutubeServiceState extends State<YoutubeService> {
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
            "YouTube",
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
                hintext:
                    "get notification when a specified artist post a video",
                stateButton: "Connect",
                col: Colors.red,
                connect: () {},
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "",
                action: () {
                },
                hintext: "Get informations about a specified video",
                stateButton: "Connect",
                col: Colors.red,
                connect: () {},
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "",
                action: () {
                },
                hintext: "Get informations about a specified channel",
                stateButton: "Connect",
                col: Colors.red,
                connect: () {},
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                services: "",
                action: () {
                },
                hintext: "Comment under a specified video",
                stateButton: "Connect",
                col: Colors.red,
                connect: () {},
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "",
                action: () {
                },
                hintext: "Like a specified video",
                stateButton: "Connect",
                col: Colors.red,
                connect: () {},
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "",
                action: () {
                },
                hintext: "Subscribe to a specied channel",
                stateButton: "Connect",
                col: Colors.red,
                connect: () {},
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
