import 'question.dart';

class QuestionHtmlModel extends QuestionModel {

  String html;

  QuestionHtmlModel(Map json) : super(json) {
    this.html = json["html"];
  }
}