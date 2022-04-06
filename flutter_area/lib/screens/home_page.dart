import 'package:explore/components/header.dart';
import 'package:explore/screens/account_view.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import '../main.dart';
import '../components/custom_services_popup.dart';
import '../screens/Movie/movie_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Header(
            appletsFun: () {
              setState(() {});
            },
            serciceFun: () => Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => ServicesPage()))),
            accountFun: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => AccountPage()))),
          ),
          SizedBox(
            height: maxHeight * (1 / 30),
          ),
          Center(
              child: Text(
            "My Applets",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
          SizedBox(width: maxWidth * .4, child: Divider()),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (gm1)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext: "Send an email with the top movies every week.",
                  stateButton: "Connect",
                  col: Colors.red,
                  connect: () {},
                ),
              if (gm2)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext: "Receive weather info every morning.",
                  stateButton: "Connect",
                  col: Colors.red,
                  connect: () {},
                ),
              if (gm3)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext: "Receive latest movies informations every week.",
                  stateButton: "Connect",
                  col: Colors.red,
                  connect: () {
                    gm2 = true;
                  },
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (gi1)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext: "Get notification when new issue is added.",
                  stateButton: "Connect",
                  col: Colors.black,
                  connect: () {},
                ),
              if (gi2)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext:
                      "Get an email when new repository created by a specific user.",
                  stateButton: "Connect",
                  col: Colors.black,
                  connect: () {},
                ),
              if (gi3)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext: "get all commits for a specified repo.",
                  stateButton: "Connect",
                  col: Colors.black,
                  connect: () {},
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (we1)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext: "Get weather infos of a specific city every morning",
                  stateButton: "Connect",
                  col: Colors.blueAccent,
                  connect: () {},
                ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (mo1)
                CustomServicesPopUp(
                    services: "",
                    action: () {},
                    hintext: "Get all new movie every week",
                    stateButton: "Connect",
                    col: Colors.redAccent,
                    connect: () async {
                      var res = await MovieModel().lastMovie();
                      if (res is String) {
                        print("ok");
                      } else
                        print("Error");
                    }),
              SizedBox(
                width: 5,
              ),
              if (mo2)
                CustomServicesPopUp(
                    services: "",
                    action: () {},
                    hintext: "Get information about a movie by email",
                    stateButton: "Connect",
                    col: Colors.redAccent,
                    connect: () async {}),
              SizedBox(
                width: 5,
              ),
              if (mo3)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext:
                      "Get notification about Top des films du moment every saturday",
                  stateButton: "Connect",
                  col: Colors.redAccent,
                  connect: () async {
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
              if (mo4)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext:
                      "    [MOVIES & GMAIL]\n\n Videos relatives à un film spécifique",
                  stateButton: "Connect",
                  col: Colors.redAccent,
                  connect: () async {},
                ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (im1)
              CustomServicesPopUp(
                services: "",
                action: () {},
                hintext: "An inspiring image",
                stateButton: "Connect",
                col: Color.fromARGB(255, 117, 153, 215),
                connect: () async {},
              ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (yu1)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext:
                      "get notification when a specified artist post a video",
                  stateButton: "Connect",
                  col: Colors.red,
                  connect: () {},
                ),
              SizedBox(
                width: 5,
              ),
              if (yu2)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext: "Get informations about a specified video",
                  stateButton: "Connect",
                  col: Colors.red,
                  connect: () {},
                ),
              SizedBox(
                width: 5,
              ),
              if (yu3)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
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
              if (yu4)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext: "Comment under a specified video",
                  stateButton: "Connect",
                  col: Colors.red,
                  connect: () {},
                ),
              SizedBox(
                width: 5,
              ),
              if (yu5)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext: "Like a specified video",
                  stateButton: "Connect",
                  col: Colors.red,
                  connect: () {},
                ),
              SizedBox(
                width: 5,
              ),
              if (yu6)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext: "Subscribe to a specied channel",
                  stateButton: "Connect",
                  col: Colors.red,
                  connect: () {},
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (ne1)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext:
                      "    [NEWS & GMAIL]\n\nReceive the most recent top headlines",
                  stateButton: "Connect",
                  col: Color.fromARGB(255, 117, 153, 215),
                  connect: () {},
                ),
              SizedBox(
                width: 5,
              ),
              if (ne2)
                CustomServicesPopUp(
                  services: "",
                  action: () {},
                  hintext:
                      "    [NEWS & GMAIL]\n\nReceive from headlines in specified country",
                  stateButton: "Connect",
                  col: Color.fromARGB(255, 117, 153, 215),
                  connect: () async {},
                ),
            ],
          )
        ],
      ),
    ));
  }
}
