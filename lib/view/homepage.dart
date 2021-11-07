import 'package:flutter/material.dart';
import 'package:todo/services/task_service.dart';
import 'package:todo/view/add_task_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Card(
          elevation: 5.0,
          color: Colors.blue,
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () async {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddTask()));
              setState(() {
                TaskService.tasks;
              });
            },
          ),
        ),
        appBar: AppBar(
          title: const Text("To Do"),
        ),
        body: ListView.builder(
            itemCount: TaskService.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                subtitle: Text("Task ${index + 1}"),
                title: Text(TaskService.tasks[index].title),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    TaskService().removeTask(task: TaskService.tasks[index]);
                    setState(() {
                      TaskService.tasks;
                    });
                  },
                ),
              );
            }));
  }
}
