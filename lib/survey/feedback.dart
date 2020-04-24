
import 'package:flutter/rendering.dart';

class FeedBack{
  String formName;
  String formDescription;
  String formBackground;
  String numberOfQuestion;
  var json;
  static var surveyJson= {
    "pages": [
      {
        "name": "page1",
        "elements": [
          {
            "type": "text",
            "name": "questionName",
            "width": "20",
            "visible": true,
            "title": "your name",
            "description": "name will be enter here",
            "valueName": "name",
            "isRequired": true,
            "requiredErrorText": "please enter your name",
            "validators": [
              {
                "type": "text",
                "minLength": 20,
                "maxLength": 0,
                "allowDigits": true
              }
            ],
            "maxLength": 25,
            "placeHolder": "enter your name here"
          },
          {
            "type": "panel",
            "name": "panel1",
            "elements": [
              {
                "type": "checkbox",
                "name": "questionItem",
                "visible": true,
                "choices": [
                  "item1",
                  "item2",
                  "item3"
                ]
              }
            ]
          },
          {
            "type": "checkbox",
            "name": "questionLanguage",
            "width": "50",
            "visible": true,
            "title": "select song language you listen",
            "description": "select your languages of songs",
            "valueName": "song you listen..",
            "isRequired": true,
            "requiredErrorText": "select atleast on language",
            "hasComment": true,
            "otherPlaceHolder": "other language you listen",
            "choices": [
              "hindi",
              "english",
              "gujarati"
            ],
            "choicesOrder": "asc",
            "hasSelectAll": true,
            "hasNone": true,
            "selectAllText": "all language"
          },
          {
            "type": "radiogroup",
            "name": "questionGender",
            "width": "50",
            "title": "select gender",
            "visible": true,
            "description": "select gender",
            "valueName": "gender",
            "isRequired": true,
            "requiredErrorText": "select one gender type",
            "choices": [
              "male",
              "female",
              "other"
            ],
            "choicesOrder": "asc",
            "hideIfChoicesEmpty": true,
            "showClearButton": true
          }
        ],
        "questionTitleLocation": "top"
      },
      {
        "name": "page2",
        "elements": [
          {
            "type": "text",
            "name": "questionAddress",
            "width": "20",
            "title": "your Address",
            "visible": true,
            "description": "address will be enter here",
            "valueName": "address",
            "isRequired": true,
            "requiredErrorText": "please enter your address",
            "maxLength": 100,
            "placeHolder": "enter your address here"
          },
          {
            "type": "dropdown",
            "name": "questionCity",
            "title": "Your City",
            "description": "select your city",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "please select your city",
            "choices": [
              "Pune",
              "Rajkot",
              "Vadodara"
            ]
          },
          {
            "type": "rating",
            "name": "questionRating",
            "title": "Your Experience with us",
            "visible": true,
            "description": "Share your experience with us",
            "isRequired": true,
            "requiredErrorText": "please give your Experience",
            "rateMax": 5
          }
        ]
      }
    ]
  };

  static var customerFeedbackJson = {
    "pages": [
      {
        "name": "page1",
        "elements": [
          {
            "type": "radiogroup",
            "name": "questionRateYourExperience",
            "title": "How would you rate your overall experience with our service?",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "This question requires an answer",
            "choices": [
              "1",
              "2",
              "3",
              "4",
              "5",
            ]
          },
          {
            "type": "text",
            "name": "questionLiveupExpectation",
            "title": "What should we change in order to live up to your expectations?",
            "description": "Write your expectations here",
            "isRequired": true,
            "visible": true,
            "inputType": "text",
            "maxLength": 100,
            "requiredErrorText": "Please write your expectations",
            "validators": [
              {
                "type": "text",
                "minLength": 10,
                "maxLength": 100,
                "allowDigits": true
              }
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionRateDesignPresentation",
            "title": "Rate our Design and Presentation",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Select your answer",
            "choices": [
              "1",
              "2",
              "3",
              "4",
              "5"
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionSatisfationLevel",
            "title": "What's youe level of satisfaction with our range of products?",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Select your answer ",
            "choices": [
              "Very Satisfied",
              "Satisfied",
              "Unsatisfied",
              "Very Unsatisfied"
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionFindingNeed",
            "title": "Finding what you needed was...",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Select your answer",
            "choices": [
              "Easy",
              "Tough"
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionQuality",
            "title": "Quality and Conditions",
            "isRequired": false,
            "visible": true,
            "choices": [
              "Very Satisfied",
              "Satisfied",
              "Unsatisfied",
              "Very Unsatisfied"
            ]
          },
          {
            "type": "rating",
            "name": "questionOvaerallRatingOrganisation",
            "title": "What's your overall rationg for our organisation?",
            "isRequired": false,
            "visible": true,
            "rateMax": 5
          },
          {
            "type": "text",
            "name": "questionSuggestion",
            "title": "What are your suggestions to help us improve?",
            "description": "Write Suggestion here",
            "isRequired": false,
            "visible": true,
            "inputType": "text",
            "maxLength": 100,
            "validators": [
              {
                "type": "text",
                "minLength": 10,
                "maxLength": 100,
                "allowDigits": true
              }
            ]
          }
        ]
      }
    ]
  };


  static var customerSatisfactionJson = {
    "pages": [
      {
        "name": "page1",
        "elements": [
          {
            "type": "radiogroup",
            "name": "questionCompanyValue",
            "title": "How much do you value our company??",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "This question requires an answer",
            "choices": [
              "1",
              "2",
              "3",
              "4",
              "5",
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionRatePricing",
            "title": "How would your rate our pricing?",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Select your answer",
            "choices": [
              "1",
              "2",
              "3",
              "4",
              "5"
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionDescribeExecutive",
            "title": "Describe our executives",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "Select your answer ",
            "choices": [
              "Enjoyable",
              "Happy",
              "Irritating",
              "Aggressive"
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionShareFriend",
            "title": "Will you share your positive with your friends/colleagues?",
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
            "title": "Any other comments to share with us?",
            "description": "Write Suggestion here",
            "isRequired": false,
            "visible": true,
            "inputType": "text",
            "maxLength": 500,
          }
        ]
      }
    ]
  };

  static var employeeStatisfactionJson = {
    "pages": [
      {
        "name": "page1",
        "elements": [
          {
            "type": "text",
            "name": "questionEmpId",
            "title": "Employee ID",
            "description": "Emp Id here",
            "isRequired": true,
            "visible": true,
            "inputType": "text",
            "maxLength": 100,
            "requiredErrorText": "Please write Employee ID",
          },
          {
            "type": "dropdown",
            "name": "questionDesignation",
            "title": "Your Designation",
            "description": "Select Designation",
            "visible": true,
            "isRequired": true,
            "requiredErrorText": "Select your Designation",
            "choices": [
              "Executive",
              "Functional",
              "Junior",
              "Senior"
            ]
          },
          {
            "type": "dropdown",
            "name": "questionWithUs",
            "title": "How long have you been associated with us?",
            "description": "Select Duration",
            "visible": true,
            "isRequired": false,
            "choices": [
              "less than 1 Year",
              "1 to 3 Years",
              "3 to 5 Years",
              "5 to 7 Years"
            ]
          },

          {
            "type": "radiogroup",
            "name": "questionWorkEnjoy",
            "title": "How adventurous and enjoyable is the work?",
            "isRequired": false,
            "visible": true,
            "choices": [
              "1",
              "2",
              "3",
              "4",
              "5"
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionWorkSkill",
            "title": "What's needed to improve your work skills?",
            "isRequired": false,
            "visible": true,
            "choices": [
              "Salary",
              "Motivation",
              "Guidance"
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionRelation",
            "title": "Relationship of superior with you",
            "isRequired": false,
            "visible": true,
            "choices": [
              "Friendly",
              "Autocratic",
              "Democratic"
            ]
          },
          {
            "type": "text",
            "name": "questionShareIdea",
            "title": "Share your own needs/ideas to increase your interest in work?",
            "description": "Write your ideas",
            "isRequired": false,
            "visible": true,
            "inputType": "text",
            "maxLength": 500,
          }
        ]
      }
    ]
  };

  static var meetingJson = {
    "pages": [
      {
        "name": "page1",
        "elements": [
          {
            "type": "radiogroup",
            "name": "questionMeeting",
            "title": "How was the meeting for you?",
            "isRequired": true,
            "visible": true,
            "requiredErrorText": "This question requires an answer",
            "choices": [
              "Very Useful",
              "Useful",
              "Out of Topic~Bored",
              "4",
              "5",
            ]
          },
          {
            "type": "radiogroup",
            "name": "questionComfortable",
            "title": "Did you feel comfortable with the meeting infrastructure?",
            "isRequired": false,
            "visible": true,
            "choices": [
              "Yes",
              "No"
            ]
          },
          {
            "type": "text",
            "name": "questionTake",
            "title": "What would you like to take with you?",
            "description": "Write answer",
            "isRequired": true,
            "requiredErrorText": "Please write what you learnt from meeting",
            "visible": true,
            "inputType": "text",
            "maxLength": 100,
          },
          {
            "type": "text",
            "name": "questionComments",
            "title": "Any other comments?",
            "description": "Write comments",
            "isRequired": false,
            "visible": true,
            "inputType": "text",
            "maxLength": 500,
          },

        ]
      }
    ]
  };


  FeedBack({this.formName, this.formDescription, this.formBackground, this.numberOfQuestion, this.json});

  static final feedBackItem = [
   /* FeedBack(formName: "Contact Form", formBackground: ('assets/images/contact-form-background.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "6", json: surveyJson),*/
    FeedBack(formName: "Customer Feedback Form", formBackground: ('assets/images/medical_report.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "8", json: customerFeedbackJson),
    FeedBack(formName: "Customer Satisfaction", formBackground: ('assets/images/online_survey.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "5", json: customerSatisfactionJson),
    FeedBack(formName: "Employee Satisfaction", formBackground: ('assets/images/iphone_and_ipad_wallpaper.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "7", json: employeeStatisfactionJson),
    FeedBack(formName: "General Event Feedback", formBackground: ('assets/images/medical_report.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "9", json: surveyJson),
    FeedBack(formName: "General Meeting Feedback", formBackground: ('assets/images/check-list.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "4", json: meetingJson),
   /* FeedBack(formName: "Instructor Feedback", formBackground: ('assets/images/report.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "6", json: surveyJson),
    FeedBack(formName: "Job Application", formBackground: ('assets/images/StoreAuditChecklist.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "3", json: surveyJson),*/
  ];
}