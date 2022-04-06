import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";
import '../../components/headerBack.dart';
import '../account_view.dart';
import '../home_page.dart';
import 'news_model.dart';

class NewsI extends StatefulWidget {
  const NewsI({Key? key}) : super(key: key);

  @override
  _NewsIState createState() => _NewsIState();
}

class _NewsIState extends State<NewsI> {
  Future getRequest() async {
    var res = await NewsModel().topNews();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
                    "Top_headlines: See the most recent top headlines",
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
              ]),
            ),
            SizedBox(
              height: maxHeight * (1 / 100),
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
                      FutureBuilder<List<dynamic>>(
                        future: NewsModel().topNews(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                            var result = snapshot.data;
                            return Column(
                              children: List.generate(
                                result!.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Title :",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            width: maxWidth * (1 / 400),
                                          ),
                                          ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  (0.7),
                                            ),
                                            child: Text(
                                              result[index]['title'],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: maxWidth * (1 / 100),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Source :",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                          SizedBox(
                                            width: maxWidth * (1 / 100),
                                          ),
                                          Text(result[index]['source']['name']),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          return Text("Is loading");
                        }),
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
