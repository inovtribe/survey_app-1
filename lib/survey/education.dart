//import 'dart:convert';
//import 'dart:core';

import 'package:flutter/material.dart';
import 'dart:collection';

class Education{

  String formName;
  String formDescription;
  String formBackground;
  String numberOfQuestion;
  Map<String, String> question;

  Education({this.formName, this.formDescription, this.formBackground, this.numberOfQuestion, this.question});
  static final educationItem = [
    Education(formName: "Course Feedback Form", formBackground: ('assets/images/edu1.jpg'), formDescription: "Collect information about courses", numberOfQuestion: "6",
      question: {
        "Register Number": "TextField",
        "Name": "TextField",
        "Course Studied": "TextField",
        "Type of Course: In Classroom, Long Distance, None": "Radio",
        "Did the course teach life skills: Yes, No" :"Radio",
        "Any other comments": "TextField"
      }),
    Education(formName: "Teacher's Leave Form", formBackground: ('assets/images/education1.jpg'), formDescription: "Gather information about how and why a teacher is going to leave", numberOfQuestion: "7"),
    Education(formName: "Leave Form Students", formBackground: ('assets/images/higher_education.jpg'), formDescription: "Get the correct reason for the Student's leave", numberOfQuestion: "4"),
    Education(formName: "Membership/Subscription Form", formBackground: ('assets/images/education_background.jpg'), formDescription: "Collect member/subscriber details", numberOfQuestion: "8"),
    Education(formName: "Post Event Form", formBackground: ('assets/images/education.jpg'), formDescription: "Gather information about a recent event", numberOfQuestion: "9"),
    Education(formName: "Seminar Feedback", formBackground: ('assets/images/education1.jpg'), formDescription: "Gather recent seminar information from students", numberOfQuestion: "5"),
  ];
}
