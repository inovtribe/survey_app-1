class Health{
  String formName;
  String formDescription;
  String formBackground;
  String numberOfQuestion;
  var json;
  static var surveyJson = {
 "pages": [
  {
   "name": "page1",
   "elements": [
    {
     "type": "html",
     "name": "questionReg",
     "html": "<h4><strong><u> Registration </u></strong>"
    },
    {
     "type": "dropdown",
     "name": "questionTeam",
     "title": "Team No",
     "visible": true,
     "description": "Choose Team number",
     "isRequired": true,
     "requiredErrorText": "Please select team number",
     "choices": [
       "Team 1",
       "Team 2",
       "Team 3",
       "Team 4"
     ]
    },
    {
     "type": "text",
     "name": "questionDateOfScreening",
     "title": "Date of Screening",
     "description": "Select date",
     "isRequired": true,
     "visible": true,
     "requiredErrorText": "Please select date",
     "inputType": "date",
     "max": "2999-12-31",
     "placeHolder": "dd-mm-yyyy"
    },
    {
     "type": "html",
     "name": "questionACF",
     "html": "<h4><strong><u> ACF Covid-19 Screening Activity </u></strong>"
    },
    {
     "type": "text",
     "name": "questionHouseNo",
     "title": "ACF House No.",
     "description": "Enter House no here",
     "isRequired": true,
     "visible": true,
     "maxLength": 25,
     "inputType": "text",
     "requiredErrorText": "Please enter house number"
    },
    {
     "type": "text",
     "name": "questionAddress",
     "title": "Address",
     "description": "Write Address here",
     "isRequired": true,
     "visible": true,
     "inputType": "text",
     "maxLength": 100,
     "requiredErrorText": "Please write your Address",
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
     "type": "text",
     "name": "questionHeadOfFamily",
     "title": "Name of the Head of Family",
     "description": "Enter Name",
     "inputType": "text",
     "maxLength": -1,
     "isRequired": true,
     "visible": true,
     "requiredErrorText": "Please write name of head of family "
    },
    {
     "type": "text",
     "name": "questionFamilyMemberName",
     "title": "Name of the family member under screening",
     "description": "Name of Family Member",
     "inputType": "text",
     "maxLength": -1,
     "isRequired": true,
     "visible": true,
     "requiredErrorText": "Family member name is required"
    },
    {
     "type": "text",
     "name": "questionAge",
     "title": "Age",
     "description": "Your Age",
     "isRequired": true,
     "visible": true,
     "requiredErrorText": "Age is required",
     "inputType": "number"
    },
    {
     "type": "dropdown",
     "name": "questionSex",
     "title": "Sex",
     "description": "Select Gender",
     "visible": true,
     "isRequired": true,
     "requiredErrorText": "Select your Gender",
     "choices": [
       "Male",
       "Female"
     ]
    },
    {
     "type": "text",
     "name": "questionMobileNo",
     "title": "Mobile No.",
     "visible": true,
     "description": "Your Contact Number",
     "inputType": "number",
     "maxLength": 10,
    },
    {
     "type": "radiogroup",
     "name": "questionDiseases",
     "title": "If having Diabetes/Asthama/Hypertension?",
     "isRequired": true,
     "visible": true,
     "requiredErrorText": "Select answer according your Diseases",
     "choices": [
      "Yes",
      "No"
     ]
    },
    {
     "type": "radiogroup",
     "name": "questionContactHistory",
     "title": "Whether Contact History with Confirmed COVID patient?",
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
     "name": "questionCoronaSymtoms",
     "title": "Whether having Cough, Fever or Difficulty in Breathing?",
     "isRequired": true,
     "visible": true,
     "requiredErrorText": "Select your answer ",
     "choices": [
      "Yes",
      "No"
     ]
    },
    {
     "type": "radiogroup",
     "name": "questionTravelHistory",
     "title": "Any foreign travel history in last 28 days?",
     "isRequired": true,
     "visible": true,
     "requiredErrorText": "Select answer you traveled foreign or not ",
     "choices": [
      "Yes",
      "No"
     ]
    },
    {
     "type": "dropdown",
     "name": "questionCountryName",
     "visible": false,
     "visibleIf": "{questionTravelHistory} = 'Yes'",
     "title": "Name of the Country",
     "isRequired": true,
     "description": "Select Country",
     "requiredErrorText": "Please Select Country",
     "choices": [
      "Afghanistan","Albania","Algeria","Andorra","Angola","Antigua & Deps","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia","Bosnia Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Central African Rep","Chad","Chile","China","Colombia","Comoros","Congo","Congo {Democratic Rep}","Costa Rica","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Greece","Grenada","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland {Republic}","Israel","Italy","Ivory Coast","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea North","Korea South","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Myanmar, {Burma}","Namibia","Nauru","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Romania","Russian Federation","Rwanda","St Kitts & Nevis","St Lucia","Saint Vincent & the Grenadines","Samoa","San Marino","Sao Tome & Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"
     ]
    },
    {
     "type": "text",
     "name": "questionArrivalDate",
     "visible": false,
     "visibleIf": "{questionTravelHistory} = 'Yes'",
     "title": "Date of Arrival in India",
     "description": "Select Date",
     "isRequired": true,
     "requiredErrorText": "Select arrival date",
     "inputType": "date",
     "max": "2999-12-31"
    },
    {
     "type": "radiogroup",
     "name": "questionStateHistory",
     "title": "Any travel history from other states in india in last 28 days?",
     "isRequired": true,
     "visible": true,
     "requiredErrorText": "Select state travel history",
     "choices": [
       "Yes",
       "No"
     ]
    },
    {
     "type": "dropdown",
     "name": "questionIndianStateName",
     "visible": false,
     "description": "Select Indian State",
     "visibleIf": "{questionStateHistory} = 'Yes'",
     "title": "Name of the Indian State",
     "isRequired": true,
     "requiredErrorText": "Please Select Indian state",
     "choices": [
      "Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chhattisgarh","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir","Jharkhand","Karnataka","Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Punjab","Rajasthan","Sikkim","Tamil Nadu","Telangana","Tripura","Uttar Pradesh","Uttarakhand","West Bengal"
     ]
    },
    {
     "type": "text",
     "name": "questionHimachalArrivalDate",
     "visible": false,
     "visibleIf": "{questionStateHistory} = 'Yes'",
     "title": "Date of Arrival in Himachal",
     "description": "Select Arrival Date",
     "isRequired": true,
     "requiredErrorText": "Select arrival date in Himachal",
     "inputType": "date",
     "max": "2999-12-31"
    }
   ]
  }
 ]
};

  Health({this.formName, this.formDescription, this.formBackground, this.numberOfQuestion, this.json});

  static final healthItem = [
    Health(formName: "COVID-19 Form", formBackground: ('assets/images/Coronavirus.jpg'), formDescription: "Himachal Covid-19 Form", numberOfQuestion: "18", json: surveyJson),
  ];
}