import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todolist/provider/todos_provider.dart';
import 'package:simple_todolist/views/widgets/todo_widget.dart';

/// ToDoList Screen
class ToDoListWidget extends StatelessWidget {
  const ToDoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDosProvider>(
      builder: (context, toDosProvider, _) {
        return toDosProvider.todos.isEmpty
            ? const Center(
                child: Text('Nothing To Do'),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: toDosProvider.todos.length,
                itemBuilder: (context, index) {
                  final todo = toDosProvider.todos[index];
                  return ToDoWidget(todo: todo);
                },
              );
      },
    );
  }
}
