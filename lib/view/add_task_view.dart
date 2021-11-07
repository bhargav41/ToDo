import 'package:flutter/material.dart';
import 'package:todo/services/task_service.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const snackbar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Saved Successfully"),
    );
    TextEditingController txt = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Enter Task Details"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txt,
              decoration: const InputDecoration(
                hintText: 'Add Task Name',
                labelText: 'Task',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  TaskService().addTask(title: txt.text);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                child: const Text("Save Task")),
          )
        ],
      ),
    );
  }
}
