import 'package:explore/components/custom_services_popup.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import '../../main.dart';
import '../../components/headerBack.dart';
import '../account_view.dart';
import '../home_page.dart';

class WeatherService extends StatefulWidget {
  WeatherService({Key? key}) : super(key: key);

  @override
  State<WeatherService> createState() => _WeatherServiceState();
}

class _WeatherServiceState extends State<WeatherService> {
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
              accountFun: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => AccountPage()))),
              serciceFun: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => ServicesPage()))),
            ),
            SizedBox(
              height: maxHeight * (1 / 30),
            ),
            Center(
                child: Text(
              "Weather",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )),
            SizedBox(width: maxWidth * .4, child: Divider()),
            SizedBox(
              height: 27,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomServicesPopUp(
                services: "[Weather & Gmail]",
                action: () {},
                hintext:
                    "Get weather infos of a specific city every morning",
                stateButton: "Connect",
                col: Colors.blueAccent,
                connect: () {
                  we1 = true;
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
