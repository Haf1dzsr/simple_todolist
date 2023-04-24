import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todolist/provider/todos_provider.dart';
import 'package:simple_todolist/views/widgets/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDosProvider>(
      builder: (context, toDosProvider, _) {
        return toDosProvider.todosCompleted.isEmpty
            ? const Center(
                child: Text('No completed tasks'),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: toDosProvider.todosCompleted.length,
                itemBuilder: (context, index) {
                  final todo = toDosProvider.todosCompleted[index];
                  return ToDoWidget(todo: todo);
                },
              );
      },
    );
  }
}
