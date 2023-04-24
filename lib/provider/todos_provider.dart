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
    ToDoModel(
      createdTime: DateTime.now(),
      title: 'Plan Pillow Party',
    ),
    ToDoModel(
      createdTime: DateTime.now(),
      title: 'Plan Dance Party',
    ),
  ];

  // List of to do lists
  List<ToDoModel> get todos =>
      _todos.where((todo) => todo.isDone == false).toList();

  // List of the to do lists that done
  List<ToDoModel> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  //  add todo
  void addTodo(ToDoModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  // remove todo
  void removeTodo(ToDoModel todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  // update Todo
  void updateToDo(ToDoModel todo, String newTitle, String newDescription) {
    todo.title = newTitle;
    todo.description = newDescription;
    notifyListeners();
  }

  // isDone method
  bool toDoStatus(ToDoModel todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }
}
