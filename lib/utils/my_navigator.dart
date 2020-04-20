import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surveyapp/main.dart';
import 'package:surveyapp/page/home_screen.dart';
import 'package:surveyapp/page/login_screen.dart';
import 'package:surveyapp/utils/surveyapp.dart';

class MyNavigator{
  static void goToHome(BuildContext context) {
//    Navigator.pushNamed(context, "/home");
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => HomeScreen()
    ));
  }
  static void goToLogin(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => LoginScreen()
    ));
  }

  static void goToTempate(BuildContext context) {
    Navigator.pushNamed(context, "/template");
  }

  static void goToForm(BuildContext context, String formName, String formDesc, String numberOfQuestion, String formBackGround, var json) {
    Navigator.pushNamed(context, "/form", arguments: GeneralFormArgument(formName, formDesc, numberOfQuestion, formBackGround, json));
  }



}