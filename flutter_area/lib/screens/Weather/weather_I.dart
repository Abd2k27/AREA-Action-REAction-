import 'package:explore/screens/Weather/weather_model.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../components/headerBack.dart';
import '../account_view.dart';
import '../home_page.dart';

class WeatherI extends StatefulWidget {
  const WeatherI({Key? key}) : super(key: key);

  @override
  _WeatherIState createState() => _WeatherIState();
}

class _WeatherIState extends State<WeatherI> {
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
                Text(
                  "Get weather infos of a specific city",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
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
                        hintText: "Choice...",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          action: () async {
                            if (_formKey.currentState!.validate()) {
                              _controller.text;
                              print(_controller.text);
                              res = await WeatherModel()
                                  .cityWeather(_controller.text);
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
              height: maxHeight * (1 / 100),
            ),
            SizedBox(width: maxWidth * .2, child: Divider()),
            SizedBox(
              height: maxHeight * (1 / 100),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Text(
                      "Lieu :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: maxHeight * (1 / 100),
                    ),
                    Text(
                      "Température :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: maxHeight * (1 / 100),
                    ),
                    Text(
                      "Humidité :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: maxWidth * (1 / 100),
                ),
                Column(
                  children: [
                    if (res != null)
                      Text(
                        "${res["locate"]}",
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
                        "${res["temp"]} °C",
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
                        "${res["humidity"]} %",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
