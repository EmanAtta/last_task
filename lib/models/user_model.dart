// To parse this JSON data, do
//
//     final dataCompleted = dataCompletedFromJson(jsonString);

import 'dart:convert';

List<DataCompleted> dataCompletedFromJson(String str) => List<DataCompleted>.from(json.decode(str).map((x) => DataCompleted.fromJson(x)));

String dataCompletedToJson(List<DataCompleted> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataCompleted {
    int? userId;
    int? id;
    String? title;
    bool? completed;

    DataCompleted({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    factory DataCompleted.fromJson(Map<String, dynamic> json) => DataCompleted(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
