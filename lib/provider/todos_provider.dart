import 'package:flutter/material.dart';
import 'package:simple_todolist/models/api/firebase_api.dart';
import 'package:simple_todolist/models/todo_model.dart';

class ToDosProvider with ChangeNotifier {
  List<ToDoModel> _todos = [];

  // List of to do lists
  List<ToDoModel> get todos =>
      _todos.where((todo) => todo.isDone == false).toList();

  // List of the to do lists that done
  List<ToDoModel> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  // set todo
  void setTodos(List<ToDoModel> todos) {
    // _todos = todos;
    // notifyListeners();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _todos = todos;
      notifyListeners();
    });
  }

  //  add todo
  void addTodo(ToDoModel todo) {
    FirebaseApi.createToDoCollection(todo);

    // _todos.add(todo);
    // notifyListeners(); => unnecessary bcz didnt change the UI
  }

  // remove todo
  void removeTodo(ToDoModel todo) {
    FirebaseApi.deleteToDo(todo);
  }

  // update Todo
  void updateToDo(ToDoModel todo, String newTitle, String newDescription) {
    todo.title = newTitle;
    todo.description = newDescription;

    FirebaseApi.updateToDo(todo);
  }

  // isDone method
  bool toDoStatus(ToDoModel todo) {
    todo.isDone = !todo.isDone;
    FirebaseApi.updateToDo(todo);

    return todo.isDone;
  }
}
