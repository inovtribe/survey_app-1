//import 'dart:convert';
//import 'dart:core';

import 'package:flutter/material.dart';
import 'dart:collection';

class Education{

  String formName;
  String formDescription;
  String formBackground;
  String numberOfQuestion;
  var json;

  static var coursefeedbackJson = {
    "pages": [
      {
        "name": "page1",
        "elements": [
          {
            "type": "text",
            "name": "questionName",
            "title": "Name",
            "description": "Write your Name here",
            "isRequired": true,
            "visible": true,
            "inputType": "text",
            "maxLength": 50,
            "requiredErrorText": "Please write your Name"
          },
          {
            "type": "text",
            "name": "questionCourse",
            "title": "Course Studied",
            "description": "Course name here",
            "isRequired": true,
            "visible": true,
            "inputType": "text",
            "maxLength": 100,
            "requiredErrorText": "Please write Course name"
          },

          {
            "type": "radiogroup",
            "name": "questionCourseType",
            "title": "Type of Course",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Select your answer",
            "choices": [
              "In Classroom",
              "Long Distance"
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionLifeSkills",
            "title": "Dis the course teach life skills??",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Select your answer",
            "choices": [
              "Yes",
              "No"
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionVideo",
            "title": "Was the course offered with illustration and videos?",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Select your answer",
            "choices": [
              "Yes",
              "No"
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionMaterial",
            "title": "Was any study material provided for the course?",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Select your answer",
            "choices": [
              "Yes",
              "No"
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionCoverage",
            "title": "Did the syllabus cover the course subject and future requirements?",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Select your answer",
            "choices": [
              "Yes",
              "No"
            ]
          },
          {
            "type": "text",
            "name": "questionComments",
            "title": "Any other comments",
            "description": "Write comments here",
            "isRequired": false,
            "visible": true,
            "inputType": "text",
            "maxLength": 100,
          }
        ]
      }
    ]
  };

  static var teacherLeaveJson = {
    "pages": [
      {
        "name": "page1",
        "elements": [
          {
            "type": "text",
            "name": "questionName",
            "title": "Name",
            "description": "Your name here",
            "isRequired": true,
            "visible": true,
            "inputType": "text",
            "maxLength": 50,
            "requiredErrorText": "Please write your name",
          },
          {
            "type": "text",
            "name": "questionStaffID",
            "title": "Staff ID",
            "description": "Write your Staff ID",
            "isRequired": true,
            "visible": true,
            "inputType": "text",
            "maxLength": 10,
            "requiredErrorText": "Please write your Staff ID",
          },
          {
            "type": "text",
            "name": "questionDept",
            "title": "Department",
            "description": "Write Department here",
            "isRequired": true,
            "visible": true,
            "inputType": "text",
            "maxLength": 100,
            "requiredErrorText": "Please write your Department",
          },

          {
            "type": "dropdown",
            "name": "questionLeaveMode",
            "title": "Mode of Leave",
            "description": "Select Leave Type",
            "visible": true,
            "isRequired": true,
            "requiredErrorText": "Select your Leave type",
            "choices": [
              "Paid Leave",
              "Casual Leave",
              "Medical Leave",
              "Holiday Leave"
            ]
          },
          {
            "type": "text",
            "name": "questionReason",
            "title": "Reason for Leave",
            "description": "Write your Reason",
            "isRequired": true,
            "visible": true,
            "inputType": "text",
            "requiredErrorText": "Please write your leave reason",
            "maxLength": 500,
          },
          {
            "type": "text",
            "name": "questionFromDate",
            "title": "From Date",
            "description": "Select date",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Please select date",
            "inputType": "date",
            "max": "2999-12-31",
            "placeHolder": "dd-mm-yyyy"
          },
          {
            "type": "text",
            "name": "questionToDate",
            "title": "To Date",
            "description": "Select date",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Please select date",
            "inputType": "date",
            "max": "2999-12-31",
            "placeHolder": "dd-mm-yyyy"
          }
        ]
      }
    ]
  };

  static var studentLeaveJson = {
    "pages": [
      {
        "name": "page1",
        "elements": [
          {
            "type": "text",
            "name": "questionName",
            "title": "Name",
            "description": "Your name here",
            "isRequired": true,
            "visible": true,
            "inputType": "text",
            "maxLength": 50,
            "requiredErrorText": "Please write your name",
          },
          {
            "type": "text",
            "name": "questionStudID",
            "title": "Student ID",
            "description": "Write your Student ID",
            "isRequired": true,
            "visible": true,
            "inputType": "text",
            "maxLength": 10,
            "requiredErrorText": "Please write your Student ID",
          },
          {
            "type": "text",
            "name": "questionCourse",
            "title": "Course",
            "description": "Write Course here",
            "isRequired": true,
            "visible": true,
            "inputType": "text",
            "maxLength": 100,
            "requiredErrorText": "Please write your Course",
          },
          {
            "type": "text",
            "name": "questionReason",
            "title": "Reason for Leave",
            "description": "Write your Reason",
            "isRequired": true,
            "visible": true,
            "inputType": "text",
            "requiredErrorText": "Please write your leave reason",
            "maxLength": 500,
          },
          {
            "type": "text",
            "name": "questionFromDate",
            "title": "From Date",
            "description": "Select date",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Please select date",
            "inputType": "date",
            "max": "2999-12-31",
            "placeHolder": "dd-mm-yyyy"
          },
          {
            "type": "text",
            "name": "questionToDate",
            "title": "To Date",
            "description": "Select date",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Please select date",
            "inputType": "date",
            "max": "2999-12-31",
            "placeHolder": "dd-mm-yyyy"
          }
        ]
      }
    ]
  };

  Education({this.formName, this.formDescription, this.formBackground, this.numberOfQuestion, this.json});
  static final educationItem = [
    Education(formName: "Course Feedback Form", formBackground: ('assets/images/edu1.jpg'), formDescription: "Collect information about courses", numberOfQuestion: "8", json: coursefeedbackJson),
    Education(formName: "Teacher's Leave Form", formBackground: ('assets/images/education1.jpg'), formDescription: "Gather information about how and why a teacher is going to leave", numberOfQuestion: "7", json: teacherLeaveJson),
    Education(formName: "Leave Form Students", formBackground: ('assets/images/higher_education.jpg'), formDescription: "Get the correct reason for the Student's leave", numberOfQuestion: "6", json: studentLeaveJson),
   /* Education(formName: "Membership/Subscription Form", formBackground: ('assets/images/education_background.jpg'), formDescription: "Collect member/subscriber details", numberOfQuestion: "8"),
    Education(formName: "Post Event Form", formBackground: ('assets/images/education.jpg'), formDescription: "Gather information about a recent event", numberOfQuestion: "9"),
    Education(formName: "Seminar Feedback", formBackground: ('assets/images/education1.jpg'), formDescription: "Gather recent seminar information from students", numberOfQuestion: "5"),*/
  ];
}
