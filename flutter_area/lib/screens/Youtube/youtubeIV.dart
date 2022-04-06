import 'package:explore/screens/Youtube/youtube_model.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../components/headerBack.dart';
import '../account_view.dart';
import '../home_page.dart';

class YouTubeIV extends StatefulWidget {
  const YouTubeIV({Key? key}) : super(key: key);

  @override
  State<YouTubeIV> createState() => _YouTubeIVState();
}

class _YouTubeIVState extends State<YouTubeIV> {
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
                    "Like the first video researched by a word",
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
                                  .likeVideo(_controller.text, username);
                              print(res);
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
                      maxWidth: MediaQuery.of(context).size.width * (0.8)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(res.toString()),
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
