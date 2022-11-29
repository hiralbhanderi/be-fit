import 'dart:convert';

List<WorkoutAllDataModel> workoutAllDataModelFromJson(String str) => List<WorkoutAllDataModel>.from(json.decode(str).map((x) => WorkoutAllDataModel.fromJson(x)));

String workoutAllDataModelToJson(List<WorkoutAllDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkoutAllDataModel {
  int? id;
  String? name;
  String? unit;
  String? type;
  int? relation;
  String? introduce;
  String? filePath;
  String? thumbnails;

  WorkoutAllDataModel(
      {this.id,
        this.name,
        this.unit,
        this.type,
        this.relation,
        this.introduce,
        this.filePath,
        this.thumbnails});

  WorkoutAllDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unit = json['unit'];
    type = json['type'];
    relation = json['relation'];
    introduce = json['introduce'];
    filePath = json['filePath'];
    thumbnails = json['thumbnails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['unit'] = this.unit;
    data['type'] = this.type;
    data['relation'] = this.relation;
    data['introduce'] = this.introduce;
    data['filePath'] = this.filePath;
    data['thumbnails'] = this.thumbnails;
    return data;
  }
}