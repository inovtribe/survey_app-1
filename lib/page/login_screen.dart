import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surveyapp/utils/my_navigator.dart';
import 'package:surveyapp/utils/surveyapp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SurveyApp.appName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: IntrinsicHeight(
              child: Container(
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                validator: validateUsername,
                                keyboardType: TextInputType.text,
                                autofocus: false,
                                decoration: _FormInputDecoration("UserName", Icon(Icons.account_box)),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  validator: validatePassword,
                                  obscureText: true,
                                  autofocus: false,
                                  decoration: _FormInputDecoration("Password", Icon(Icons.vpn_key)),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                            ],
                          ),
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              RaisedButton(
                                splashColor: Colors.red,
                                color: Colors.redAccent,
                                onPressed: validateInputs,
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateInputs() {
    if(_formKey.currentState.validate()){
      print("Successfully validate");
      setState(() {
        setLoginState(true);
      });
      MyNavigator.goToHome(context);
    }
    else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validatePassword(String pass) {
    if(pass.length < 3){
      return "Password length should be greater than 3";
    }
    else{
      return null;
    }
  }

  String validateUsername(String userName) {
    if(userName.length == 0){
      return "Username is Required!";
    }
    else{
      return null;
    }
  }

  Future<Null> setLoginState(bool isLogin) async{
    await SharedPreferences.getInstance().then((prefs){
      setState(() {
        prefs.setBool(SurveyApp.isLogIn, isLogin);
      });
    });
  }

  InputDecoration _FormInputDecoration(String labelName, Icon icon){
    return InputDecoration(
      prefixIcon: icon,
      labelText: labelName,
      labelStyle: TextStyle(fontSize: 15.0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1,
        )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: const BorderSide(
          color: Colors.green,
          width: 1,
        )
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        )
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        )
      ),
      errorStyle: TextStyle(fontWeight: FontWeight.bold)
    );
  }
}
