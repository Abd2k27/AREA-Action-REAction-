import 'package:explore/screens/Youtube/youtube_model.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../components/headerBack.dart';
import '../account_view.dart';
import '../home_page.dart';

class YouTubeII extends StatefulWidget {
  const YouTubeII({Key? key}) : super(key: key);

  @override
  State<YouTubeII> createState() => _YouTubeIIState();
}

class _YouTubeIIState extends State<YouTubeII> {
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
                    "Get informations about a channel researched by a word",
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
                                  .channelInfo(_controller.text);
                              // print(res);
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
                          "Titre :  ${res["Title"]}",
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
                          "Vues :  ${res["view"]}",
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
                          "Abonnés :  ${res["followers"]}",
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
                          "Nombre de Vidéos :  ${res["vid"]}",
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
