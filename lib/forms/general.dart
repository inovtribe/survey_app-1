import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:survey_js_core/model/element_survey.dart';
import 'package:survey_js_core/model/page.dart';
import 'package:survey_js_core/model/panel.dart';
import 'package:survey_js_core/model/question.dart';
import 'package:survey_js_core/model/question_checkbox.dart';
import 'package:survey_js_core/model/question_dropdown.dart';
import 'package:survey_js_core/model/question_html.dart';
import 'package:survey_js_core/model/question_radio.dart';
import 'package:survey_js_core/model/question_rating.dart';
import 'package:survey_js_core/model/question_text.dart';
import 'package:survey_js_core/model/survey.dart';
import 'package:survey_js_core/survey_js_core.dart';
import 'package:survey_js_core/survey_validator.dart';
import 'package:intl/intl.dart';
import 'package:surveyapp/database/db_helper.dart';

import 'dart:core';
import 'dart:async';


import 'package:surveyapp/main.dart';
import 'package:surveyapp/models/covid.dart';
import 'package:surveyapp/page/detail_screen.dart';
import 'package:surveyapp/survey/education.dart';
import 'package:surveyapp/survey/health.dart';
import 'package:surveyapp/utils/my_navigator.dart';

class GeneralForm extends StatefulWidget {
  final String formName, formDescription, numberOfQuestion, formBackground;
  final json;

  GeneralForm(this.formName, this.formDescription, this.numberOfQuestion, this.formBackground, this.json);
  @override
  State<StatefulWidget> createState() {
    return GeneralFormState(this.formName,
      this.formDescription,
      this.numberOfQuestion,
      this.formBackground,
      this.json);
  }
}

class GeneralFormState extends State<GeneralForm>{
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  List<TextEditingController> controllerList;

  String formName, formDescription, numberOfQuestion, formBackground;
  var json;

  GeneralFormState(this.formName,
    this.formDescription,
    this.numberOfQuestion,
    this.formBackground,
    this.json);

  List<PageModel> pages;
  bool _autoValidate = false;
  DatabaseHelper helper = DatabaseHelper();

  ValueChanged _onChanged = (val) { print(val);};

  @override
  void initState() {
    super.initState();
    pages = List();

    var pageAll = json["pages"];
    print("Pages : ${pageAll.length}");
    for(int i=0; i < pageAll.length; i++) {
      var elements = pageAll[i]["elements"] as List<Map<String, dynamic>>;
      List<QuestionModel> questions = List();
      List<PanelModel> panels = List();
      for(int j = 0; j < elements.length; j++){
        if(elements[j]["type"] == "text"){
          //print("Element ${j} : ${elements[j]}");
          questions.add(QuestionTextModel(elements[j]));
        }
        else if(elements[j]["type"] == "checkbox"){
          //print("Element ${j} : ${elements[j]}");
          questions.add(QuestionCheckboxModel(elements[j]));
        }
        else if(elements[j]["type"] == "radiogroup"){
          //print("Element ${j} : ${elements[j]}");
          questions.add(QuestionRadioModel(elements[j]));
        }
        else if(elements[j]["type"] == "dropdown"){
          //print("Element ${j} : ${elements[j]}");
          questions.add(QuestionDropdownModel(elements[j]));
        }
        else if(elements[j]["type"] == "panel"){
          //print("Element ${j} : ${elements[j]}");
          panels.add(PanelModel(elements[j]));
        }
        else if(elements[j]["type"] == "rating"){
          questions.add(QuestionRatingModel(elements[j]));
        }
        else if(elements[j]["type"] == "html"){
          questions.add(QuestionHtmlModel(elements[j]));
        }
      }
      print("Question Length : ${questions.length}");
      PageModel pageModel = PageModel(pageAll[i]);
      pageModel.name = "page${(i+1).toString()}";
//      pageModel.navigationButtonVisibility = NavigationButtonVisibility.SHOW;
      print("PageModel Name : ${pageModel.name}");
      pageModel.element = ElementSurvey(elements);
      pages.add(pageModel);

      SurveyJsonParser surveyJsonParser = SurveyJsonParser();
      surveyJsonParser.parseAllPages(pageAll[i]);
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(formName, style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Container(
//        Text(args.formName + "\n" + args.formDescription + "\n$question" ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(formBackground),
                fit: BoxFit.fill
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
              child: Container(
                color: Colors.white.withOpacity(0.7),
                child: SingleChildScrollView(

                  child: Column(
                    children: <Widget>[
                      FormBuilder(
                        key: _fbKey,
                        autovalidate: _autoValidate,
                        child: Column(
                          children: bindFormData(pages),
                        )
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

  List<Widget> bindFormData(List<PageModel> pages){
    List<Widget> widgets = [];
    controllerList = [];

    for(int i=0; i<pages.length; i++){
      List<QuestionModel> questions = pages[i].element.questions;
     /* List<PanelModel> panels = pages[i].element.panels;
      if(panels != null){
        panels.forEach((panel) {
          if(panel.elementSurvey.questions != null) {
            questions.addAll(panel.elementSurvey.questions);
          }
        });
      }*/

      if(questions != null) {
        print("QuestionSize: ${questions.length}");
        questions.forEach((question) {
          switch (question.type) {
            case "text":
              QuestionTextModel textQuestion = question;
              if(textQuestion.inputType == "date"){

                widgets.add(Visibility(
                  maintainState: true,
                  visible: textQuestion.visible,
                  child: designAllWidget(FormBuilderDateTimePicker(
                    attribute: textQuestion.name,
                    decoration: _FormInputDecoration(textQuestion),
                    inputType: InputType.date,
                    validators: (textQuestion.isRequired) ? [
                      FormBuilderValidators.required(
                        errorText: textQuestion.requiredErrorText)
                    ] : [],
                    format: DateFormat("dd-MM-yyyy"),
                  ), textQuestion.isRequired
                    ? textQuestion.title + " *"
                    : textQuestion.title)
                ));
              }
              else {
                widgets.add(Visibility(visible: textQuestion.visible,
                  maintainState: true,
                  child: designAllWidget(FormBuilderTextField(
                    attribute: textQuestion.name,
                    decoration: _FormInputDecoration(textQuestion),
                    textInputAction: TextInputAction.done,
                    keyboardType: (textQuestion.inputType == "number")
                      ? TextInputType.number : TextInputType.text,
                    maxLength: (textQuestion.maxLength != -1)?textQuestion.maxLength:null,
                    validators: (textQuestion.isRequired) ? [
                      FormBuilderValidators.required(
                        errorText: textQuestion.requiredErrorText),
                      (textQuestion.inputType == "number")?FormBuilderValidators.numeric():FormBuilderValidators.max(textQuestion.maxLength)
                    ] : [(textQuestion.inputType == "number")?FormBuilderValidators.numeric():FormBuilderValidators.max(textQuestion.maxLength)],
                  ), textQuestion.isRequired
                    ? textQuestion.title + " *"
                    : textQuestion.title)));
              }
              break;

            case "radiogroup":
              QuestionRadioModel radioQuestion = question;

              widgets.add(designAllWidget(FormBuilderRadio(
                decoration: _FormInputDecoration(radioQuestion),
                attribute: radioQuestion.name,
                options: radioQuestion.choices.map((choice) => FormBuilderFieldOption(value: choice)).toList(growable: false),
                onChanged: (val){

                  if(_fbKey.currentState.fields['questionTravelHistory'].currentState.value == "Yes"){
                    setState(() {
                      /*selectionSetToYes(*//*questions[15], questions[16]*//*questions);*/

                      questions.asMap().forEach((index, question) {
                        if(index == 15 || index == 16){
                          question.visible = true;
                          question.isRequired = true;
                        }
                      });
                    });
                  }
                  else if(_fbKey.currentState.fields['questionTravelHistory'].currentState.value == "No"){
                    setState(() {
                      List<FormFieldState<dynamic>> type = [];
                      type.add(_fbKey.currentState.fields['questionCountryName'].currentState);
                      type.add(_fbKey.currentState.fields['questionArrivalDate'].currentState);

                      type.forEach((element) {element.reset();});
                      questions.asMap().forEach((index, question) {

                        if(index == 15 || index ==16){
                          question.visible = false;
                          question.isRequired = false;
                        }
                      });

//                      selectionSetToNo(questions[15], questions[16], 'questionCountryName', 'questionArrivalDate');
                    });

                  }else {setState(() {
                    print(val);
                  });}

                  if(_fbKey.currentState.fields['questionStateHistory'].currentState.value == "Yes"){
                    setState(() {
                      selectionSetToYes(questions[18], questions[19]);
                    });

                  }
                  else if(_fbKey.currentState.fields['questionStateHistory'].currentState.value == "No"){
                    setState(() {
                      selectionSetToNo(questions[18], questions[19], 'questionIndianStateName', 'questionHimachalArrivalDate');
                    });

                  }else{print(val);}
                },
                validators: (radioQuestion.isRequired) ? [
                  FormBuilderValidators.required(
                    errorText: radioQuestion.requiredErrorText)
                ] : [],
              ), radioQuestion.isRequired
                ? radioQuestion.title + " *"
                : radioQuestion.title));
              break;

            case "checkbox":

              QuestionCheckboxModel checkboxModel = question;

              widgets.add(designAllWidget(FormBuilderCheckboxList(
                decoration: _FormInputDecoration(checkboxModel),
                attribute: checkboxModel.name,
                options: checkboxModel.choices.map((e) => FormBuilderFieldOption(value: e,)).toList(growable: false),
                onChanged: _onChanged,
                validators: (checkboxModel.isRequired) ? [
                  FormBuilderValidators.required(
                    errorText: checkboxModel.requiredErrorText)
                ] : [],
              ), checkboxModel.isRequired
                ? checkboxModel.title + " *"
                : checkboxModel.title));
              break;

            case "dropdown":
              QuestionDropdownModel dropdownModel = question;
              var allCountries = dropdownModel.choices;
              if(allCountries.length > 10) {
                widgets.add(Visibility(
                  visible: dropdownModel.visible,
                  maintainState: true,
                  child: designAllWidget(FormBuilderTypeAhead(
                    decoration: _FormInputDecoration(dropdownModel),
                    attribute: dropdownModel.name,
                    onSaved: _onChanged,
                    validators: (dropdownModel.isRequired) ? [
                      FormBuilderValidators.required(
                        errorText: dropdownModel.requiredErrorText)
                    ] : [],
                    itemBuilder: (context, country) {
                      return ListTile(
                        title: Text(country),
                      );
                    },
                    suggestionsBoxDecoration: SuggestionsBoxDecoration(
                      elevation: 0.0,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      color: Colors.white,
                    ),
                    suggestionsCallback: (query) {
                      if (query.length != 0) {
                        var lowercaseQuery = query.toLowerCase();
                        return allCountries.where((country) {
                          return country
                            .toLowerCase()
                            .contains(lowercaseQuery);
                        }).toList(growable: false)
                          ..sort((a, b) =>
                            a
                              .toLowerCase()
                              .indexOf(lowercaseQuery)
                              .compareTo(
                              b.toLowerCase().indexOf(lowercaseQuery)));
                      } else {
                        return allCountries;
                      }
                    },
                  ),
                    dropdownModel.isRequired
                      ? dropdownModel.title + " *"
                      : dropdownModel.title),
                ));
              }
              else {
                widgets.add((Visibility(
                  maintainState: true,
                  visible: dropdownModel.visible,
                  child: designAllWidget(FormBuilderDropdown(
                    decoration: _FormInputDecoration(dropdownModel),
                    attribute: dropdownModel.name,
                    items: allCountries.map((choice) =>
                      DropdownMenuItem(
                        value: choice,
                        child: Text("$choice"))).toList(),
                    validators: (dropdownModel.isRequired) ? [
                      FormBuilderValidators.required(
                        errorText: dropdownModel.requiredErrorText)
                    ] : [],
                  ), dropdownModel.isRequired
                    ? dropdownModel.title + " *"
                    : dropdownModel.title))
                ));
              }
              break;
            case "rating":
           QuestionRatingModel ratingQuestion = question;
              widgets.add(designAllWidget(FormBuilderRate(
                decoration: _FormInputDecoration(ratingQuestion),
                max: ratingQuestion.rateMax,
                attribute: ratingQuestion.name,
                validators: (ratingQuestion.isRequired) ? [
                  FormBuilderValidators.required(
                    errorText: ratingQuestion.requiredErrorText)
                ] : [],
              ), ratingQuestion.isRequired
                ? ratingQuestion.title + " *"
                : ratingQuestion.title));
              break;

            case "html":
              QuestionHtmlModel htmlQuestion = question;
              widgets.add(Padding(
                padding: const EdgeInsets.all(16.0),
                child: Html(data: htmlQuestion.html,shrinkToFit: true),
              ));
              break;
          }
        });
      }
    }

    print("Widgets Length : ${widgets.length}");
    widgets.add(Padding(
      padding: const EdgeInsets.all(50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            color:  Colors.deepOrange,
            onPressed: (){
              if (_fbKey.currentState.saveAndValidate()) {
                print("validation Successful");
//                SurveyChecker surveyChecker = SurveyChecker();
//                List<Map<String, dynamic>> data = [];
//                data.add(_fbKey.currentState.value);
//
//                List<SurveyCheckerError> errror = surveyChecker.completeSurvey(SurveyJsonParser().parseSurveyJson(surveyJson), data);
//                errror.forEach((element) {print(element.toString());});
//                print(errror.length);

                print(_fbKey.currentState.value);
                if(formName != "COVID-19 Form"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailPage(formName);
                  },));
                }else{
                  _saveInfoInDb();
                }

              } else {
                setState(() {
                  _autoValidate = true;
                });

                print(_fbKey.currentState.value);
                print("validation failed");
              }
            },
            child: Text("Submit",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
          ),
          RaisedButton(
            color:  Colors.deepOrange,
            onPressed: (){
              Navigator.pop(context);
              //Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
            },
            child: Text("Cancel", style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
          ),

        ],
      ),
    ));
    return widgets;
  }

  void _saveInfoInDb() async{
    String team = _fbKey.currentState.fields['questionTeam'].currentState.value;
    String dateOfScreening = _fbKey.currentState.fields['questionDateOfScreening'].currentState.value.toString().split(" ")[0];
    String houseNo = _fbKey.currentState.fields['questionHouseNo'].currentState.value;
    String address = _fbKey.currentState.fields['questionAddress'].currentState.value;
    String headOfFamily = _fbKey.currentState.fields['questionHeadOfFamily'].currentState.value;
    String familyMemberName = _fbKey.currentState.fields['questionFamilyMemberName'].currentState.value;
    int age = int.parse(_fbKey.currentState.fields['questionAge'].currentState.value);
    String sex = _fbKey.currentState.fields['questionSex'].currentState.value;
    String mobileNo = _fbKey.currentState.fields['questionMobileNo'].currentState.value;
    String diseases = _fbKey.currentState.fields['questionDiseases'].currentState.value;
    String contactHistory = _fbKey.currentState.fields['questionContactHistory'].currentState.value;
    String coronaSymtoms = _fbKey.currentState.fields['questionCoronaSymtoms'].currentState.value;
    String travelHistory = _fbKey.currentState.fields['questionTravelHistory'].currentState.value;
    String countryName = _fbKey.currentState.fields['questionCountryName'].currentState.value;
    String arrivalDate = _fbKey.currentState.fields['questionArrivalDate'].currentState.value.toString().split(" ")[0];
    String stateHistory = _fbKey.currentState.fields['questionStateHistory'].currentState.value;
    String indianStateName = _fbKey.currentState.fields['questionIndianStateName'].currentState.value;
    String himachalArrivalDate = _fbKey.currentState.fields['questionHimachalArrivalDate'].currentState.value.toString().split(" ")[0];
    Covid covid;
    covid = Covid(
      team,dateOfScreening,houseNo,address,headOfFamily,familyMemberName,age,sex, mobileNo,diseases,contactHistory, coronaSymtoms, travelHistory, stateHistory, countryName, arrivalDate, indianStateName, himachalArrivalDate);

    int result = await helper.insertCovidInformation(covid);
    if(result != 0){
      print("Patient Information Saved Successfully");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DetailPage(formName);
      },));
    }
    else {
      print("Error in Saving Information, please try again later");
    }
  }

  Widget designAllWidget(Widget w, String title){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title ?? "title",
                  style: TextStyle(

                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: w
            )
          ],
        ),
      ),
    );
  }

//  List<FormBuilderFieldOption> ratingChoices(num ratMax){
//    List<FormBuilderFieldOption> options = [];
//    for(int i = 1; i <= ratMax; i++){
//      options.add(FormBuilderFieldOption(
//        value: i,
//        child: Text(i.toString()),
//      ));
//    }
//    return options;
//  }

  selectionSetToYes(questionModel_18_15, questionModel_19_16){


      questionModel_18_15.visible = true;
      questionModel_18_15.isRequired = true;
      questionModel_19_16.visible = true;
      questionModel_19_16.isRequired = true;


  }

  selectionSetToNo(questionModel_18_15, questionModel_19_16, country_state_name, arrivalDate){

      List<FormFieldState<dynamic>> type = [];
      type.add(_fbKey.currentState.fields[country_state_name].currentState);
      type.add(_fbKey.currentState.fields[arrivalDate].currentState);

      type.forEach((element) {element.reset();});

      questionModel_18_15.visible = false;
      questionModel_18_15.isRequired = false;
      questionModel_19_16.visible = false;
      questionModel_19_16.isRequired = false;
  }

  InputDecoration _FormInputDecoration(QuestionModel questionModel){
    return InputDecoration(
      labelText: questionModel.description,
      labelStyle: TextStyle(fontSize: 15.0),
      /*suffixIcon: (questionModel.type == "dropdown") ?Icon(Icons.arrow_drop_down):null,*/

      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1,
        )
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: const BorderSide(
          color: Colors.green,
          width: 2,
        )
      ),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: const BorderSide(
          color: Colors.green,
          width: 1,
        )
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        )
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        )
      ),
      errorStyle: TextStyle(fontWeight: FontWeight.bold),
      //errorText: questionModel.requiredErrorText
    );
  }
}
