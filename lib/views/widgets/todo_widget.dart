import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simple_todolist/models/todo_model.dart';
import 'package:simple_todolist/utils/constants/theme.dart';

class ToDoWidget extends StatelessWidget {
  final ToDoModel todo;
  const ToDoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          key: Key(todo.id),
          direction: Axis.horizontal,
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: primaryColor,
                foregroundColor: whiteColor,
                icon: Icons.edit,
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: dangerColor,
                foregroundColor: whiteColor,
                icon: Icons.delete,
              ),
            ],
          ),
          child: buildToDo(context),
        ),
      );

  Widget buildToDo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            activeColor: primaryColor,
            checkColor: whiteColor,
            value: todo.isDone,
            onChanged: (_) {},
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    fontSize: 22,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Text(
                    todo.description ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
