import 'package:explore/screens/Youtube/youtube_model.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../components/headerBack.dart';
import '../account_view.dart';
import '../home_page.dart';

class YouTubeI extends StatefulWidget {
  const YouTubeI({Key? key}) : super(key: key);

  @override
  State<YouTubeI> createState() => _YouTubeIState();
}

class _YouTubeIState extends State<YouTubeI> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  var res;
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
              accountFun: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => AccountPage()))),
              serciceFun: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => ServicesPage()))),
            ),
            SizedBox(
              height: maxHeight * (1 / 30),
            ),
            Form(
              key: _formKey,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * (0.7),
                  ),
                  child: Text(
                    "Get informations about a video researched by a word",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(width: maxWidth * .4, child: Divider()),
                SizedBox(
                  height: maxHeight * (1 / 100),
                ),
                SizedBox(
                  width: maxWidth * .3,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _controller,
                        hintText: "Word...",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          action: () async {
                            if (_formKey.currentState!.validate()) {
                              _controller.text;
                              print(_controller.text);
                              res = await YoutubeModel()
                                  .videoInfo(_controller.text);
                              setState(() {});
                            }
                          },
                          content: Text(
                            "Done",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ))
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: maxHeight * (1 / 20),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * (0.7),
                  ),
                  child: Column(
                    children: [
                      if (res != null)
                        Text(
                          "Titre :  ${res["titre"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      SizedBox(
                        height: maxHeight * (1 / 100),
                      ),
                      if (res != null)
                        Text(
                          "Description :  ${res["desc"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      SizedBox(
                        height: maxHeight * (1 / 100),
                      ),
                      if (res != null)
                        Text(
                          "Chaîne :  ${res["chaine"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      SizedBox(
                        height: maxHeight * (1 / 100),
                      ),
                      if (res != null)
                        Text(
                          "Date :  ${res["date"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
