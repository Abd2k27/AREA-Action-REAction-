import 'package:explore/components/custom_textfield.dart';
import 'package:explore/components/header_services.dart';
import 'package:explore/screens/Github/githubI.dart';
import 'package:explore/screens/Github/githubII.dart';
import 'package:explore/screens/Github/githubIII.dart';
import 'package:explore/screens/Github/githubIV.dart';
import 'package:explore/screens/Gmail/gmail_model.dart';
import 'package:explore/screens/Youtube/youtubeI.dart';
import 'package:explore/screens/Youtube/youtubeII.dart';
import 'package:explore/screens/Youtube/youtubeIII.dart';
import 'package:explore/screens/Youtube/youtubeIV.dart';
import 'package:explore/screens/Youtube/youtubeV.dart';
import 'package:explore/screens/Youtube/youtube_model.dart';
import 'package:explore/screens/Youtube/youtube_view.dart';
import 'package:explore/screens/account_view.dart';
import 'package:explore/screens/Github/github_view.dart';
import 'package:explore/screens/Gmail/gmail_view.dart';
import 'package:explore/screens/home_page.dart';
import 'package:explore/screens/Movie/movies_view.dart';
import 'package:explore/screens/Weather/weather_view.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import '../components/custom_button_services.dart';
import '../components/custom_services_popup.dart';
import '../components/headerBack.dart';
import 'Github/github_model.dart';
import "../../main.dart";
import 'Movie/movie_model.dart';
import 'Weather/weather_model.dart';

class TriggerPage extends StatefulWidget {
  const TriggerPage({Key? key}) : super(key: key);

  @override
  State<TriggerPage> createState() => _TriggerPageState();
}

class _TriggerPageState extends State<TriggerPage> {
  String username = "";
  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? _name = prefs.getString('_name');
    setState(() {
      username = _name!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _controllerI = TextEditingController();

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
            "Triggers",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
          SizedBox(width: maxWidth * .4, child: Divider()),
          SizedBox(
            height: maxHeight * (1 / 20),
          ),

          /*--------------------------------- Gmail ---------------------------------*/
          SizedBox(width: maxWidth * .2, child: Divider()),
          Center(
            child: Text(
              "Movies / News / Weather / Quotes / Image -> Gmail",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(width: maxWidth * .1, child: Divider()),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                services: "[Movies & Gmail]",
                action: () {},
                hintext:
                    "Send an email with the top movies on Saturday's 8 PM. ",
                stateButton: "Connect",
                col: Color.fromARGB(255, 236, 158, 70),
                connect: () async {
                  gm1 = true;
                  var res = await MailModel().topMoviesMail(username);
                },
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "[Weather & Gmail]",
                action: () {},
                hintext: "Receive weather info every morning at 9 AM.",
                stateButton: "Connect",
                col: Color.fromARGB(255, 91, 156, 221),
                connect: () {
                  gm2 = true;
                  showDialog(
                    context: context,
                    builder: (_) => Form(
                      key: _formKey,
                      child: AlertDialog(
                        content: CustomTextField(
                            controller: _controller, hintText: "Your location"),
                        actions: [
                          OutlinedButton(
                            onPressed: (() async {
                              if (_formKey.currentState!.validate()) {
                                _controller.text;
                                print(_controller.text);
                                var res = await MailModel()
                                    .weatherMail(username, _controller.text);
                                setState(() {});
                              }
                            }),
                            child: Text("Ok"),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                services: "[News & Gmail]",
                action: () {},
                hintext: "Receive top news informations every morning at 9 AM.",
                stateButton: "Connect",
                col: Color.fromARGB(255, 255, 17, 0),
                connect: () async {
                  gm1 = true;
                  var res = await MailModel().topNewsMail(username);
                },
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "[Movies & Gmail]",
                action: () {},
                hintext: "Receive latest movies informations everyday at 8 PM.",
                stateButton: "Connect",
                col: Color.fromARGB(255, 236, 158, 70),
                connect: () async {
                  gm2 = true;
                  var res = await MailModel().latestMoviesMail(username);
                },
              ),
            ],
          ),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                services: "[News & Gmail]",
                action: () {},
                hintext:
                    "Receive top headlines informations every morning at 9 AM.",
                stateButton: "Connect",
                col: Color.fromARGB(255, 255, 17, 0),
                connect: () {
                  gm1 = true;
                  showDialog(
                    context: context,
                    builder: (_) => Form(
                      key: _formKey,
                      child: AlertDialog(
                        content: CustomTextField(
                            controller: _controller, hintText: "The word"),
                        actions: [
                          OutlinedButton(
                            onPressed: (() async {
                              if (_formKey.currentState!.validate()) {
                                _controller.text;
                                print(_controller.text);
                                var res = await MailModel()
                                    .topHeadlinesNewsMail(
                                        username, _controller.text);
                                setState(() {});
                              }
                            }),
                            child: Text("Ok"),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "[Quotes & Gmail]",
                action: () {},
                hintext: "Receive 5 quotes everyday at 9 AM.",
                stateButton: "Connect",
                col: Color.fromARGB(255, 148, 200, 100),
                connect: () async {
                  gm2 = true;
                  var res = await MailModel().quotesMail(username);
                },
              ),
            ],
          ),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                services: "[Image & Gmail]",
                action: () {},
                hintext: "Receive background image every morning at 9 AM.",
                stateButton: "Connect",
                col: Color.fromARGB(255, 131, 91, 205),
                connect: () async {
                  gm1 = true;
                  var res = await MailModel().imageMail(username);
                },
              ),
            ],
          ),
          SizedBox(
            height: maxHeight * (1 / 20),
          ),

          /*--------------------------------- YouTube ---------------------------------*/
          SizedBox(width: maxWidth * .2, child: Divider()),
          Center(
            child: Text(
              "YouTube",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(width: maxWidth * .1, child: Divider()),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                services: "[YouTube]",
                action: () {},
                hintext: "Get informations about a video researched by a word",
                stateButton: "Connect",
                col: Colors.red,
                connect: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => YouTubeI())));
                  gm2 = true;
                },
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "[YouTube]",
                action: () {},
                hintext:
                    "Get informations about a channel researched by a word",
                stateButton: "Connect",
                col: Colors.red,
                connect: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => YouTubeII())));
                  gm2 = true;
                },
              ),
            ],
          ),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                services: "[YouTube]",
                action: () {},
                hintext: "Get latest video of a channel",
                stateButton: "Connect",
                col: Colors.red,
                connect: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => YouTubeIII())));
                  gm2 = true;
                },
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "[YouTube]",
                action: () {},
                hintext: "Like the first video researched by a word",
                stateButton: "Connect",
                col: Colors.red,
                connect: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => YouTubeIV())));
                  gm2 = true;
                },
              ),
            ],
          ),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                services: "[YouTube]",
                action: () {},
                hintext: "Dislike the first video researched by a word",
                stateButton: "Connect",
                col: Colors.red,
                connect: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => YouTubeV())));
                  gm2 = true;
                },
              ),
            ],
          ),
          SizedBox(
            height: maxHeight * (1 / 20),
          ),

          /*--------------------------------- Github ---------------------------------*/
          SizedBox(width: maxWidth * .2, child: Divider()),
          Center(
            child: Text(
              "Github",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(width: maxWidth * .1, child: Divider()),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                services: "[Github]",
                action: () {},
                hintext: "Informations about the profile of the user",
                stateButton: "Connect",
                col: Colors.black,
                connect: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => GithubI())));
                  gm2 = true;
                },
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "[Github]",
                action: () {},
                hintext:
                    "Get all issues for a specified repo",
                stateButton: "Connect",
                col: Colors.black,
                connect: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => GithubII())));
                  gm2 = true;
                },
              ),
            ],
          ),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomServicesPopUp(
                services: "[Github]",
                action: () {},
                hintext: "Get all commits for a specified repo",
                stateButton: "Connect",
                col: Colors.black,
                connect: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => GithubIII())));
                  gm2 = true;
                },
              ),
              SizedBox(
                width: 5,
              ),
              CustomServicesPopUp(
                services: "[Github]",
                action: () {},
                hintext: "Get all repo of user",
                stateButton: "Connect",
                col: Colors.black,
                connect: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => GithubIV())));
                  gm2 = true;
                },
              ),
            ],
          ),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
        ],
      )),
    );
  }
}
