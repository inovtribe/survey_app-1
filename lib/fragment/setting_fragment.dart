import 'dart:ui';

import 'package:flutter/material.dart';

class SettingFragment extends StatefulWidget {
  @override
  _SettingFragmentState createState() => _SettingFragmentState();
}

class _SettingFragmentState extends State<SettingFragment> {

  bool isSwitchCheck = false;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/online_survey.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
          child: Container(
            color: Colors.white.withOpacity(0.8),
            child: Column(
              children: <Widget>[
                Text("Global Settings", textAlign: TextAlign.center, style: textStyle,),
                Row(
                  children: <Widget>[
                    Expanded(flex: 1,child: Text("Push Notification", style: textStyle,)),
                    Switch(
                      value: isSwitchCheck,
                      onChanged: (val){
                        setState(() {
                          isSwitchCheck =true;
                        });
                      }
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
