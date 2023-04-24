import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todolist/provider/bottom_navbar_provider.dart';
import 'package:simple_todolist/utils/constants/theme.dart';
import 'package:simple_todolist/views/widgets/add_todo_dialog_widget.dart';
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
      Container(),
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
        body: tabs[bottomNavBarProvider.currentIndex],
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
