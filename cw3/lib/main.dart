import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const MyApp());
}
class Task {
  String task;
  bool status;

  Task({required this.task, required this.status});

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
  List<Task> taskList = [];
  String taskstring = '';
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadTasks() async {
    final loaded = await loadTasks();
    setState(() {
      taskList = loaded;
    });
    if (taskList.isNotEmpty) {
      print('Loaded list: $taskList');
    } else {
      print('No list found.');
    }
  }
  void addTask(Task task) {
    setState(() {
      taskList.add(task);
      saveTasks(taskList);
    });
  }
  void updateTask(int index) {
    setState(() {
      taskList[index].status = !taskList[index].status;
      saveTasks(taskList);
    });
  }
  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
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
            SizedBox(height: 50),
            SizedBox(
              width: 450,
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  taskstring = value;
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'task',
                ),
              ),
            ),
            const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  side: BorderSide(color: const Color.fromARGB(255, 0, 128, 255), width: 3.0), // Border color and width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    ),
                  ),
                onPressed: () {
                  if (taskstring.trim().isEmpty) return;
                  addTask(Task(task: taskstring.trim(), status: false));
                  taskstring = '';
                  _controller.clear();
                },
	              child: const Text('Add Task'),
	            ),
              const SizedBox(height: 20),
              Expanded(
                child: taskList.isEmpty
                    ? const Text('No tasks')
                    : ListView.builder(
                        itemCount: taskList.length,
                        itemBuilder: (context, index) {
                          return Center (
                            child: Container(
                              width: 400,
                          child: ListTile(
                            title: Text(taskList[index].task),
                            subtitle: taskList[index].status ? Text('(Completed)') : null,
                            leading: Checkbox(
                              value: taskList[index].status,
                              onChanged: (v) {
                                updateTask(index);
                              },
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                deleteTask(index);
                              },
                            ),
                          ),
                          )
                          );
                        },
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
