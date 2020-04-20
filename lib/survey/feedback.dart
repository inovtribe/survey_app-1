
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

  FeedBack({this.formName, this.formDescription, this.formBackground, this.numberOfQuestion, this.json});

  static final feedBackItem = [
    FeedBack(formName: "Contact Form", formBackground: ('assets/images/contact-form-background.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "6", json: surveyJson),
    FeedBack(formName: "Customer Feedback Form", formBackground: ('assets/images/medical_report.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "7", json: customerFeedbackJson),
    FeedBack(formName: "Customer Satisfaction", formBackground: ('assets/images/online_survey.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "4", json: surveyJson),
    FeedBack(formName: "Employee Satisfaction", formBackground: ('assets/images/iphone_and_ipad_wallpaper.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "8", json: surveyJson),
    FeedBack(formName: "General Event Feedback", formBackground: ('assets/images/medical_report.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "9", json: surveyJson),
    FeedBack(formName: "General Meeting Feedback", formBackground: ('assets/images/check-list.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "5", json: surveyJson),
    FeedBack(formName: "Instructor Feedback", formBackground: ('assets/images/report.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "6", json: surveyJson),
    FeedBack(formName: "Job Application", formBackground: ('assets/images/StoreAuditChecklist.jpg'), formDescription: "Gather Contact Details", numberOfQuestion: "3", json: surveyJson),
  ];
}