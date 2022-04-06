import 'package:explore/components/custom_button.dart';
import 'package:explore/components/header_services.dart';
import 'package:explore/screens/account_view.dart';
import 'package:explore/screens/Github/github_view.dart';
import 'package:explore/screens/home_page.dart';
import 'package:explore/screens/trigger_view.dart';
import "package:flutter/material.dart";
import '../components/custom_button_services.dart';
import 'Github/github_model.dart';
import 'google_model.dart';

class ServicesPage extends StatefulWidget {
  ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _HomePageState();
}

class _HomePageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderServices(
              appletsFun: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => HomePage()))),
              accountFun: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => AccountPage()))),
              serciceFun: () {
                setState(() {});
              },
            ),
            SizedBox(
              height: maxHeight * (1 / 30),
            ),
            Center(
                child: Text(
              "My Services",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
            SizedBox(width: maxWidth * .4, child: Divider()),
            SizedBox(
              height: maxHeight * (1 / 100),
            ),
            CustomButtonServices(
              hintText: "  Google  ",
              connect: () async {
                var user = await GoogleModel().google();
              },
            ),
            SizedBox(
              height: maxHeight * (1 / 100),
            ),
            CustomButtonServices(hintText: " Movies  ", connect: () {}),
            SizedBox(
              height: maxHeight * (1 / 100),
            ),
            CustomButtonServices(hintText: " Weather ", connect: () {}),
            SizedBox(
              height: maxHeight * (1 / 100),
            ),
            CustomButtonServices(hintText: "   News   ", connect: () {}),
            SizedBox(
              height: maxHeight * (1 / 100),
            ),
            CustomButtonServices(hintText: "   Image   ", connect: () {}),
            SizedBox(
              height: maxHeight * (1 / 100),
            ),
            CustomButtonServices(
                hintText: "   Github   ",
                connect: () async {
                  var user = await GithubModel().github();
                }),
            SizedBox(
              height: maxHeight * (1 / 100),
            ),
            CustomButtonServices(hintText: " YouTube ", connect: () {}),
            SizedBox(
              height: maxHeight * (1 / 100),
            ),
            CustomButton(
                action: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => TriggerPage())));
                },
                content: Text("Go to Triggers"))
          ],
        ),
      ),
    );
  }
}
