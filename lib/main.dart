import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      title: "ToDo App",
      home: ToDoApp(),
    ));

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  String value = '';

  var listTODO = [''];
  addToDo(String item) {
    setState(() {
      listTODO.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "ToDoApp",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          addToDo(value);
        },
      ),
      body: ListView.builder(
          itemCount: listTODO.length,
          itemBuilder: (context, index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      onChanged: (val) {
                        value = val;
                      },
                    ),
                  )
                : ListTile(
                    leading: const Icon(Icons.info),
                    trailing: const Icon(Icons.access_alarm_sharp),
                    title: Text(
                      '${listTODO[index]}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
          }),
    );
  }
}
