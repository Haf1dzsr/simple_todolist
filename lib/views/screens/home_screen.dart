import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todolist/models/api/firebase_api.dart';
import 'package:simple_todolist/models/todo_model.dart';
import 'package:simple_todolist/provider/bottom_navbar_provider.dart';
import 'package:simple_todolist/provider/todos_provider.dart';
import 'package:simple_todolist/utils/constants/theme.dart';
import 'package:simple_todolist/views/widgets/add_todo_dialog_widget.dart';
import 'package:simple_todolist/views/widgets/compeleted_list_widget.dart';
import 'package:simple_todolist/views/widgets/todo_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const ToDoListWidget(),
      const CompletedListWidget(),
    ];
    return Consumer<BottomNavBarProvider>(
      builder: (context, bottomNavBarProvider, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text('To Do App'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: primaryColor,
          unselectedItemColor: whiteColor.withOpacity(0.7),
          selectedItemColor: whiteColor,
          currentIndex: bottomNavBarProvider.currentIndex,
          onTap: (index) => bottomNavBarProvider.selectedIndex(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined),
              label: 'Todos',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
                size: 28,
              ),
              label: 'Completed',
            ),
          ],
        ),
        body: StreamBuilder<List<ToDoModel>>(
          stream: FirebaseApi.readToDos(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasError) {
                  return const Text('Something went Wrong');
                } else {
                  final provider = Provider.of<ToDosProvider>(context);
                  final todos = snapshot.data;
                  provider.setTodos(todos!);

                  return tabs[bottomNavBarProvider.currentIndex];
                }
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
            // barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return const AddToDoDialogWidget();
            },
          ),
          backgroundColor: primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
