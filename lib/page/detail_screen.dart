import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String appbarTitle;
  DetailPage(this.appbarTitle);
  @override
  _DetailPageState createState() => _DetailPageState(this.appbarTitle);
}

class _DetailPageState extends State<DetailPage> {
  String appbarTitle;

  _DetailPageState(this.appbarTitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(appbarTitle, style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/images/complete_survey.gif'),
              Text("Survey Completed", textAlign: TextAlign.center, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              RaisedButton(
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
                  },
                color: Colors.redAccent,
                child: Text("Go to Home Screen",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
