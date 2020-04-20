import 'package:flutter/material.dart';
import 'package:surveyapp/forms/general.dart';
import 'package:surveyapp/page/home_screen.dart';
import 'package:surveyapp/page/login_screen.dart';
import 'package:surveyapp/page/splash_screen.dart';
import 'package:surveyapp/page/template_screen.dart';

void main(){

  var routes = <String, WidgetBuilder>{
    "/home" : (BuildContext context) => HomeScreen(),
    "/login" : (BuildContext context) => LoginScreen(),
    "/template" : (BuildContext context) => TemplateScreen(),
    //"/form" : (BuildContext context) => GeneralForm(),
  };

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.redAccent,
      accentColor: Colors.green,
      fontFamily: 'Caviar_Dreams_Bold',
    ),
    home: SplashScreen(),
    routes: routes,
  ));
}

class GeneralFormArgument{
  final String formName;
  final String formDescription;
  final String numberOfQuestion;
  final String formBackGround;
  final json;

  GeneralFormArgument(this.formName, this.formDescription, this.numberOfQuestion, this.formBackGround, this.json);
}

