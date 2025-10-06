import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
            Expanded(
              child: Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('food'),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            /*Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const SecondRoute(),
                              ),
                            );*/
                          },
                          child: const Text('View Recipe'),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('food'),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            /*Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const SecondRoute(),
                              ),
                            );*/
                          },
                          child: const Text('View Recipe'),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('food'),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            /*Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const SecondRoute(),
                              ),
                            );*/
                          },
                          child: const Text('View Recipe'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
