import 'package:explore/components/custom_button.dart';
import 'package:explore/components/head_title.dart';
import 'package:explore/screens/services_view.dart';
import "package:flutter/material.dart";

class HeaderServices extends StatelessWidget {
  final Function()? appletsFun;
  final Function()? serciceFun;
  final Function()? accountFun;
  const HeaderServices({
    Key? key,
    this.appletsFun,
    this.serciceFun,
    this.accountFun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeadTitle(),
        Row(
          children: [
            GestureDetector(onTap: appletsFun, child: Text("My Applets", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),),
            SizedBox( width: maxWidth * (1/100),),
            GestureDetector(onTap: serciceFun, child: Text("My Services", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),),
            SizedBox(width: maxWidth * (1/100),),
            SizedBox(width: maxWidth * (1/100),),
            GestureDetector(onTap: accountFun, child: CircleAvatar(radius: 20,),),
            SizedBox(width: maxWidth * (1/100),),],
        ),],);
  }
}