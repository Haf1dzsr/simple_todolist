import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoField {
  static const createdTime = 'createdTime';
}

class ToDoModel {
  DateTime createdTime;
  String title;
  String id;
  String? description;
  bool isDone;

  ToDoModel({
    required this.createdTime,
    required this.title,
    this.description,
    this.id = '',
    this.isDone = false,
  });

  static ToDoModel fromJson(Map<String, dynamic> json) => ToDoModel(
        createdTime: toDateTime(json['createdTime']),
        title: json['title'],
        description: json['description'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'id': id,
        'isDone': isDone,
      };

  /// createdTime needs
  static DateTime toDateTime(Timestamp time) {
    // if (time == null) return null;
    return time.toDate();
  }

  /// createdTime needs to Json
  static dynamic fromDateTimeToJson(DateTime date) {
    // if (date == null) return null;
    return date.toUtc();
  }
}
