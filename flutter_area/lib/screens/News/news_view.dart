import 'package:explore/components/custom_services_popup.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import '../../components/headerBack.dart';
import '../account_view.dart';
import '../home_page.dart';
import 'news_model.dart';
import '../../main.dart';

class NewsService extends StatefulWidget {
  const NewsService({Key? key}) : super(key: key);

  @override
  _NewsServiceState createState() => _NewsServiceState();
}

class _NewsServiceState extends State<NewsService> {
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
            "News",
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
                services: "[NEWS & GMAIL]",
                action: () {},
                hintext:
                    "Receive the most recent top headlines",
                stateButton: "Connect",
                col: Color.fromARGB(255, 117, 153, 215),
                connect: () {
                  ne1 = true;
                },
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "[NEWS & GMAIL]",
                action: () {},
                hintext:
                    "Receive from headlines in specified country",
                stateButton: "Connect",
                col: Color.fromARGB(255, 117, 153, 215),
                connect: () async {
                  ne2 = true;
                },
              ),
            ],
          )
        ],
      ),
    ));
  }
}
