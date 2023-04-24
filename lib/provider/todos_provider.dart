import 'package:flutter/material.dart';
import 'package:simple_todolist/models/todo_model.dart';

class ToDosProvider with ChangeNotifier {
  final List<ToDoModel> _todos = [
    ToDoModel(
      createdTime: DateTime.now(),
      title: 'Buy Food',
      description: '''- Eggs
- Milk
- Water
- Bread''',
    ),
    ToDoModel(
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent Some Hotel
- Rent a car
- Pack suitcase''',
    ),
    ToDoModel(
      createdTime: DateTime.now(),
      title: 'Walk the dog',
    ),
    ToDoModel(
      createdTime: DateTime.now(),
      title: 'Plan Jacobs Party',
    ),
  ];
  List<ToDoModel> get todos =>
      _todos.where((todo) => todo.isDone == false).toList();
}
