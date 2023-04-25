import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_todolist/models/todo_model.dart';
import 'package:simple_todolist/utils/constants/utils.dart';

class FirebaseApi {
  // Collection = table
  // Make a new collection named 'Todo'
  static Future<String> createToDoCollection(ToDoModel todo) async {
    final docToDo = FirebaseFirestore.instance.collection('todo').doc();

    // set the coll's id to object model class
    todo.id = docToDo.id;
    await docToDo.set(todo.toJson());

    return docToDo.id;
  }

  static Stream<List<ToDoModel>> readToDos() => FirebaseFirestore.instance
      .collection('todo')
      .orderBy(ToDoField.createdTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(ToDoModel.fromJson));

  static Future updateToDo(ToDoModel todo) async {
    final docToDo = FirebaseFirestore.instance.collection('todo').doc(todo.id);
    await docToDo.update(todo.toJson());
  }

  static Future deleteToDo(ToDoModel todo) async {
    final docToDo = FirebaseFirestore.instance.collection('todo').doc(todo.id);
    await docToDo.delete();
  }
}
