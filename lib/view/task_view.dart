import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskView extends StatelessWidget {
  List<String> tasks = [];
  // ignore: use_key_in_widget_constructors
  TaskView(this.tasks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(tasks[index]),
            subtitle: Text("Task ${(index + 1).toString()}"),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                const snackbar = SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text("Task deleted successfully"),
                );
                tasks.remove(tasks[index]);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
            ),
          );
        },
      ),
    );
  }
}
