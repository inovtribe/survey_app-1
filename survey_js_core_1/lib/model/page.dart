import 'element_survey.dart';

class PageModel {
  bool readOnly, visible, areQuestionRandomized, isStarted, wasShown;
  num maxTimeToFinish, timeSpent, visibleIndex;
  NavigationButtonVisibility navigationButtonVisibility;
  String description, enableIf, name, title, visibleIf;
  QuestionOrder questionOrder;
  QuestionTitleLocation questionTitleLocation;

  ElementSurvey element;

  PageModel(Map<String, dynamic> json) {
    areQuestionRandomized = json["areQuestionRandomized"];
    isStarted = json["isStarted"];
    wasShown = json["wasShown"];

    maxTimeToFinish = json["maxTimeToFinish"];
    timeSpent = json["timeSpent"];
    visibleIndex = json["visibleIndex"];

    readOnly = json["readOnly"];
    visible = json["visible"];

    description = json["description"];
    enableIf = json["enableIf"];
    name = json["name"];
    navigationButtonVisibility =
        _getNavigationBtnVisibility(json["navigationButtonsVisibility"]);
    questionOrder = _getQuestionOrder(json["questionOrder"]);
    questionTitleLocation =
        _getQuestionTitleLocation(json["questionTitleLocation"]);

    element = ElementSurvey(json["elements"] as List<Map<String, dynamic>>);
  }

  QuestionOrder _getQuestionOrder(String questionOrder) {
    switch (questionOrder) {
      case "default":
        return QuestionOrder.DEFAULT;
      case "initial":
        return QuestionOrder.INITIAL;
      case "random":
        return QuestionOrder.RANDOM;
      default:
        return QuestionOrder.DEFAULT;
    }
  }

  QuestionTitleLocation _getQuestionTitleLocation(
      String questionTitleLocation) {
    switch (questionTitleLocation) {
      case "default":
        return QuestionTitleLocation.DEFAULT;
      case "top":
        return QuestionTitleLocation.TOP;
      case "bottom":
        return QuestionTitleLocation.BOTTOM;
      case "hidden":
        return QuestionTitleLocation.HIDDEN;
      case "left":
        return QuestionTitleLocation.LEFT;
      default:
        return QuestionTitleLocation.DEFAULT;
    }
  }

  NavigationButtonVisibility _getNavigationBtnVisibility(String visibility) {
    switch (visibility) {
      case "inherit":
        return NavigationButtonVisibility.INHERIT;
      case "show":
        return NavigationButtonVisibility.SHOW;
      case "hide":
        return NavigationButtonVisibility.HIDE;
      default:
        return NavigationButtonVisibility.SHOW;
    }
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    return other is PageModel && other.name == this.name;
  }

  @override
  int get hashCode {
    return this.hashCode ^ this.name.hashCode;
  }
}

enum NavigationButtonVisibility { INHERIT, SHOW, HIDE }
enum QuestionOrder { DEFAULT, INITIAL, RANDOM }
enum QuestionTitleLocation { DEFAULT, TOP, BOTTOM, LEFT, HIDDEN }
