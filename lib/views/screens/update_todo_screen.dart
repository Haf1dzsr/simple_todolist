import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todolist/models/todo_model.dart';
import 'package:simple_todolist/provider/todos_provider.dart';
import 'package:simple_todolist/utils/constants/theme.dart';

class UpdateTodoScreen extends StatefulWidget {
  final ToDoModel todo;
  const UpdateTodoScreen({Key? key, required this.todo}) : super(key: key);

  @override
  State<UpdateTodoScreen> createState() => _UpdateTodoScreenState();
}

class _UpdateTodoScreenState extends State<UpdateTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String? description;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
    titleController.text = widget.todo.title;
    descriptionController.text = widget.todo.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDosProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Todo'),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              provider.removeTodo(widget.todo);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Edit Task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: titleController,
                // TextEditingController(text: widget.todo.title),
                maxLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (title) {
                  if (title!.isEmpty) {
                    return 'The title cannot be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              TextFormField(
                controller: descriptionController,
                // TextEditingController(text: widget.todo.description),
                maxLines: 3,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String newTitle = titleController.text;
                      String newDescription = descriptionController.text;
                      // edit todo
                      provider.updateToDo(
                          widget.todo, newTitle, newDescription);

                      Navigator.of(context).pop();
                    }
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(primaryColor),
                  ),
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
