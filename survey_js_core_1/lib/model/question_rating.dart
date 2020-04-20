import 'question.dart';

class QuestionRatingModel extends QuestionModel {

  num rateMax, rateStep;
  String minRateDescription, maxRateDescription;

  QuestionRatingModel(Map json) : super(json) {
    this.rateMax = json["rateMax"];
    this.rateStep = json["rateStep"];
    this.minRateDescription = json["minRateDescription"];
    this.maxRateDescription = json["maxRateDescription"];
  }
}
