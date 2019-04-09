import 'package:flutter/material.dart';
import 'package:flutter_horseman/page/home_page.dart';

class NavigatorUtils{
  ///主页
  static goHome(BuildContext context){
    Navigator.pushReplacementNamed(context, HomePage.sName);
  }

  ///登陆主页
 static goLogin(BuildContext context){
//    Navigator.pushReplacementNamed(context, LoginPage.sName);
 }
}