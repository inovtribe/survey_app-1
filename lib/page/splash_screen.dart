import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surveyapp/utils/my_navigator.dart';
import 'package:surveyapp/utils/surveyapp.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool isLogin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoginState();
    Timer(Duration(seconds: 3), () {
      isLogin
        ? MyNavigator.goToHome(context)
        : MyNavigator.goToLogin(context);

    });
  }

  Future<Null> getLoginState() async{
    await SharedPreferences.getInstance().then((prefs) {
      setState(() {
        isLogin = prefs.getBool(SurveyApp.isLogIn);
        print("isLogin : $isLogin");
        if(isLogin == null)
          isLogin = false;
        //userName = inputString;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xffFF7878),const Color(0xffFCD181)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(Icons.supervised_user_circle, size: 80.0, color: Colors.green,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text("Survey Supervisor", style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  ),
                )
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text(
                        SurveyApp.welcomeMessage,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                      
                    ],
                  ),
                ))
            ],
          )
        ],
      ),
    );
  }
}