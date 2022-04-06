import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:explore/screens/home_page.dart';
import 'package:explore/screens/login_view.dart';
import 'package:explore/screens/register_view.dart';

import 'package:explore/screens/services_view.dart';
import 'package:explore/screens/trigger_view.dart';

import 'package:explore/utils/authentication.dart';
import 'package:explore/utils/theme_data.dart';
import 'package:flutter/material.dart';

var gi1 = false, gi2 = false, gi3 = false, gi4 = false;
var gm1 = false, gm2 = false, gm3 = false;
var im1 = false;
var mo1 = false, mo2 = false, mo3 = false, mo4 = false;
var we1 = false;
var yu1 = false,
    yu2 = false,
    yu3 = false,
    yu4 = false,
    yu5 = false,
    yu6 = false;
var ne1 = false, ne2 = false;
void main() {
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AREA',
      theme: lightThemeData,
      debugShowCheckedModeBanner: false,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: LoginView(),
      routes: {
        "/client.apk": (_) => const Scaffold(
          body: Center(
            child: Text("Android SDK version 32.1.0-rc1",),
          ),
        )
      },
    );
  }
}
