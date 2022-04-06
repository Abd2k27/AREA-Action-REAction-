import 'package:explore/components/custom_services_popup.dart';
import 'package:explore/screens/Movie/movie_model.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import '../../main.dart';
import '../../components/headerBack.dart';
import '../account_view.dart';
import '../home_page.dart';

class MoviesService extends StatefulWidget {
  MoviesService({Key? key}) : super(key: key);

  @override
  State<MoviesService> createState() => _MoviesServiceState();
}

class _MoviesServiceState extends State<MoviesService> {
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
            "Movies",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          )),
          SizedBox(width: maxWidth * .4, child: Divider()),
          SizedBox(
            height: maxHeight * (1 / 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                  services: "",
                  action: () {
                  },
                  hintext:
                      "Get all new movie every week",
                  stateButton: "Connect",
                  col: Colors.redAccent,
                  connect: () async {
                    mo1 = true;
                    var res = await MovieModel().lastMovie();
                    if (res is String) {
                      print("ok");
                    } else
                      print("Error");
                  }),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                  services: "",
                  action: () {
                  },
                  hintext:
                      "Get information about a movie by email",
                  stateButton: "Connect",
                  col: Colors.redAccent,
                  connect: () async {
                    mo2 = true;
                  }),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "",
                action: () {
                },
                hintext:
                    "Get notification about Top des films du moment every saturday",
                stateButton: "Connect",
                col: Colors.redAccent,
                connect: () async {
                  mo3 = true;
                  var res = await MovieModel().topMovie();
                  if (res is String) {
                    print("ok");
                  } else
                    print("Error");
                },
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
