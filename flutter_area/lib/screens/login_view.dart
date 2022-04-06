import 'package:explore/components/custom_button.dart';
import 'package:explore/components/custom_textfield.dart';
import 'package:explore/screens/google_model.dart';
import 'package:explore/screens/login_model.dart';
import 'package:explore/screens/register_view.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
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
                    padding: EdgeInsets.symmetric(
                        horizontal: maxWidth * (1 / 30), vertical: 20),
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
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) => RegisterView())));
                                },
                                child: Text(
                                  "REGISTER",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 30,
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
                          height: 30,
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
                          height: maxHeight * (1 / 20),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              action: () async {
                                if (_formKey.currentState!.validate()) {
                                  var user = await LoginModel()
                                      .login(username, password);
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  print(user);
                                  prefs.setString(
                                      '_name', "${user["username"]}");
                                  prefs.setString(
                                      '_password', "${user["pass"]}");
                                  if (user is bool && !user) {
                                    print("Error");
                                  } else if (user is String && user == "null") {
                                    print("Error");
                                  } else
                                    (Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: ((context) => HomePage())),
                                    ));
                                }
                              },
                              content: Text(
                                "Login",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
