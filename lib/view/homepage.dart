import 'package:flutter/material.dart';
import 'package:todo/view/task_view.dart';

List<String> tasks = [];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("To Do"),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.navigate_next,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TaskView(tasks)));
              },
            ),
          ],
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: const Text("Add Task"),
          ),
        ));
  }
}

showAlertDialog(BuildContext context) {
  const snackbar = SnackBar(
    duration: Duration(seconds: 2),
    content: Text("Saved Successfully"),
  );
  TextEditingController txt = TextEditingController();
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Save"),
    onPressed: () {
      tasks.add(txt.text);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    },
  );
  AlertDialog alert = AlertDialog(
    title: const Text("Add Task"),
    content: SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: Column(
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
          )
        ],
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
