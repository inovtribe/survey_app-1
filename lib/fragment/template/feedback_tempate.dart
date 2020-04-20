import 'package:flutter/material.dart';
import 'package:surveyapp/forms/general.dart';
import 'package:surveyapp/survey/education.dart';
import 'package:surveyapp/survey/feedback.dart';
import 'package:surveyapp/survey/health.dart';
import 'dart:core';

import 'package:surveyapp/utils/my_navigator.dart';

class FeedBackTemplates extends StatefulWidget {
  final String templateName;

  @override
  _FeedBackTemplatesState createState() => _FeedBackTemplatesState();

  FeedBackTemplates({Key key, @required this.templateName}) : super(key: key);
}



class _FeedBackTemplatesState extends State<FeedBackTemplates> {

  Widget build(BuildContext context) {
    var itemList;

    switch(widget.templateName){
      case "Feedback":
        itemList = FeedBack.feedBackItem;
        break;
      case "Education":
        itemList = Education.educationItem;
        break;
      case "Health":
        itemList = Health.healthItem;
        break;
      default:
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index){
            return Card(
              child: InkWell(
                onTap: (){navigateToGeneralForm(itemList[index].formName, itemList[index].formDescription, itemList[index].numberOfQuestion, itemList[index].formBackground, itemList[index].json);},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Image.asset(itemList[index].formBackground,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black.withOpacity(0.7),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text((itemList[index].numberOfQuestion) + " Questions", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                        ),
                        width: double.infinity,
                        height: 70,
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(itemList[index].formName,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              )
                            ),
                            Text(itemList[index].formDescription,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
//                          Text(itemList[index].numberOfQuestion, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  void navigateToGeneralForm(String formName, String formDescription, String numberOfQuestion, String formBackground, var json){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return GeneralForm(formName, formDescription, numberOfQuestion, formBackground, json);
    }));
  }
}
