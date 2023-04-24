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
}
