import 'package:explore/components/custom_button.dart';
import 'package:explore/components/custom_button_account.dart';
import 'package:explore/components/custom_button_services.dart';
import 'package:explore/components/custom_textfield.dart';
import 'package:explore/components/header.dart';
import 'package:explore/screens/account_model.dart';
import 'package:explore/screens/home_page.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

import 'login_view.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String name = "";
  String password = "";
  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? _name = prefs.getString('_name');
    final String? _pass = prefs.getString('_password');
    setState(() {
      name = _name!;
      password = _pass!;
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

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Header(
            appletsFun: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => HomePage()))),
            serciceFun: () => Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => ServicesPage()))),
          ),
          SizedBox(
            height: maxHeight * (1 / 30),
          ),
          Center(
              child: Text(
            "Account Settings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
          SizedBox(width: maxWidth * .4, child: Divider()),
          SizedBox(
            height: maxHeight * (1 / 100),
          ),
          SizedBox(
              width: maxWidth * (1 / 2),
              child: CustomButtonAccount(
                hintext: name,
              )),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              width: maxWidth * (1 / 2),
              child: CustomButtonAccount(
                hintext: password,
              )),
          SizedBox(
            height: maxHeight * (1 / 20),
          ),
          CustomButton(
            action: () async {
              showDialog(
                context: context,
                builder: (_) => Form(
                  key: _formKey,
                  child: AlertDialog(
                    content: Center(
                      child: CustomTextField(
                          controller: _controller, hintText: "The word"),
                    ),
                    actions: [
                      OutlinedButton(
                        onPressed: (() async {
                          if (_formKey.currentState!.validate()) {
                            _controller.text;
                            print(_controller.text);
                            //var user = await AccountModel().update();
                            //setState(() {});
                          }
                        }),
                        child: Text("Ok"),
                      )
                    ],
                  ),
                ),
              );
            },
            content: Text(
              "Update",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: maxHeight * (1 / 20),
          ),
          CustomButton(
            action: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => LoginView())));
            },
            content: Text(
              "Log out",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
