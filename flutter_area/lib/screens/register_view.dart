import 'package:explore/components/custom_button.dart';
import 'package:explore/components/custom_textfield.dart';
import 'package:explore/components/head_title.dart';
import 'package:explore/screens/home_page.dart';
import 'package:explore/screens/login_view.dart';
import 'package:explore/screens/register_model.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

import 'google_model.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: maxWidth * (1 / 30), vertical: 20),
                    child: Text(
                      "AREA",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              SizedBox(
                  width: maxWidth * .7,
                  height: maxHeight * .6,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * (0.8)),
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(27.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  LoginView())));
                                    },
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    )),
                                Text(
                                  "REGISTER",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: maxHeight * (1 / 20),
                            ),
                            CustomTextField(
                              hintText: "Username...",
                              getValue: (String value) {
                                setState(() {
                                  username = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: maxHeight * (1 / 100),
                            ),
                            CustomTextField(
                              hintText: "Email...",
                              getValue: (String value) {
                                setState(() {
                                  email = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: maxHeight * (1 / 100),
                            ),
                            CustomTextField(
                              hintText: "Password...",
                              getValue: (String value) {
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: maxHeight * (1 / 100),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  action: () async {
                                    if (_formKey.currentState!.validate()) {
                                      var user = await RegisterModel()
                                          .register(username, email, password);
                                      print(user);
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString(
                                          '_name', "${user["username"]}");
                                      prefs.setString('_mail', "${user["mail"]}");
                                      prefs.setString(
                                          '_password', "${user["pass"]}");
                                      if (user is bool && !user) {
                                        print("Error");
                                      } else
                                        (Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) => HomePage())),
                                        ));
                                    }
                                  },
                                  content: Text(
                                    "Register",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: maxHeight * (1 / 100),
                                ),
                                CustomButton(
                                  action: () async {
                                    var user = await GoogleModel().google();
                                    if (user is bool && !user) {
                                      print("Error");
                                    } else
                                      (Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) => HomePage())),
                                      ));
                                  },
                                  content: Text(
                                    "Google",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
