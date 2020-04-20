
import 'package:survey_js_core/model/question_html.dart';

import '../exceptions.dart';
import 'panel.dart';
import 'question_dropdown.dart';

import 'question.dart';
import 'question_checkbox.dart';
import 'question_radio.dart';
import 'question_text.dart';
import 'question_rating.dart';
import 'question_html.dart';

class ElementSurvey {
  List<QuestionModel> questions;
  List<PanelModel> panels;

  ElementSurvey(List<Map<String, dynamic>> elements) {
    try {
      final typePanel = elements.where((element) {
        return element["type"] == "panel";
      }).toList();

      final typeQuestion = elements.where((element) {
        return element["type"] != "panel";
      }).toList();

      if (typeQuestion.isNotEmpty) {
        questions = _parseQuestions(typeQuestion);
      }

      if (typePanel.isNotEmpty) {
        panels = _parsePanels(typePanel);
      }
    } catch (exception) {
      print(exception);
    }
  }

  List<QuestionModel> _parseQuestions(List<Map<String, dynamic>> questions) {
    return (questions)?.map((question) {
      switch (question["type"]) {
        case "text":
          return QuestionTextModel(question);
        case "checkbox":
          return QuestionCheckboxModel(question);
        case "radiogroup":
          return QuestionRadioModel(question);
        case "dropdown":
          return QuestionDropdownModel(question);
        case "rating":
          return QuestionRatingModel(question);
        case "html":
          return QuestionHtmlModel(question);
        default:
          throw InvalidTypeException("Type is mismactch");
      }
    })?.toList();
  }

  List<PanelModel> _parsePanels(List<Map<String, dynamic>> panels) {
    return (panels)?.map((panel) {
      return PanelModel(panel);
    })?.toList();
  }
}
