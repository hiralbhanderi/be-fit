// To parse this JSON data, do
//
//     final buttWorkoutModel = buttWorkoutModelFromJson(jsonString);

import 'dart:convert';

List<ButtWorkoutModel> buttWorkoutModelFromJson(String str) => List<ButtWorkoutModel>.from(json.decode(str).map((x) => ButtWorkoutModel.fromJson(x)));

String buttWorkoutModelToJson(List<ButtWorkoutModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ButtWorkoutModel {
  ButtWorkoutModel({
    this.day,
    this.exercise,
  });

  int? day;
  List<Exercise>? exercise;

  factory ButtWorkoutModel.fromJson(Map<String, dynamic> json) => ButtWorkoutModel(
    day: json["day"],
    exercise: List<Exercise>.from(json["exercise"].map((x) => Exercise.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "exercise": List<dynamic>.from(exercise!.map((x) => x.toJson())),
  };
}

class Exercise {
  Exercise({
    this.actionId,
    this.kcal,
    this.time,
  });

  int? actionId;
  double? kcal;
  int? time;

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    actionId: json["actionId"],
    kcal: json["kcal"].toDouble(),
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "actionId": actionId,
    "kcal": kcal,
    "time": time,
  };
}
