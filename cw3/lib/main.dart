import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const MyApp());
}
class Task {
  String task;
  bool status = false;

  Task({required this.task, required bool status});

  Map<String, dynamic> toJson() => {
    'task': task,
    'status': status,
  };
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      task: json['task'] as String,
      status: json['status'] as bool,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task>? taskList;
  String taskstring = '';

  @override
  void initState() {
    super.initState();
      setState(() async {
        taskList = await loadTasks();
      });
      if (taskList != null) {
          print('Loaded list: $taskList');
        } else {
          print('No list found.');
        }
  }
  addTask(Task task) {
    setState(() {
      taskList?.add(task);
      saveTasks(taskList!);
    });
   }
  Future<void> saveTasks(List<Task> objects) async {
      final prefs = await SharedPreferences.getInstance();
      final List<Map<String, dynamic>> objectMaps = objects.map((obj) => obj.toJson()).toList();
      final String jsonString = jsonEncode(objectMaps);
      await prefs.setString('myListKey', jsonString);
    }

   Future<List<Task>> loadTasks() async {
      final prefs = await SharedPreferences.getInstance();
      final String? jsonString = prefs.getString('myListKey');

      if (jsonString == null) {
        return [];
      }

      final List<dynamic> objectMaps = jsonDecode(jsonString);
      return objectMaps.map((map) => Task.fromJson(map as Map<String, dynamic>)).toList();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 75,
              child: TextField(
                onChanged: (value) {
                  taskstring = value;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'id',
                ),
              ),
            ),
            const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  side: BorderSide(color: const Color.fromARGB(255, 0, 128, 255), width: 3.0), // Border color and width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    ),
                  ),
	              onPressed: addTask(Task(task: taskstring, status: false)),
	              child: const Text('Add Task'),
	            ),
          ],
        ),
      ),
    );
  }
}
