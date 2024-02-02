import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todolist/models/todo_model.dart';
import 'package:simple_todolist/provider/todos_provider.dart';
import 'package:simple_todolist/utils/constants/theme.dart';

class AddToDoDialogWidget extends StatefulWidget {
  const AddToDoDialogWidget({super.key});

  @override
  State<AddToDoDialogWidget> createState() => _AddToDoDialogWidgetState();
}

class _AddToDoDialogWidgetState extends State<AddToDoDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDosProvider>(context, listen: false);
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Add Task',
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
                    // create todo
                    final todo = ToDoModel(
                        createdTime: DateTime.now(),
                        id: DateTime.now().toString(),
                        title: titleController.text,
                        description: descriptionController.text);

                    provider.addTodo(todo);
                    titleController.clear();
                    descriptionController.clear();
                    Navigator.of(context).pop(context);
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
    );
  }
}
