import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Recipes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Recipe List'),
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
            Text("Select a Recipe", 
            style: TextStyle (fontSize: 32),),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const Food(data: "Pimento Cheese Sandwich"),
                              ),
                            );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const Food(data: "Burger"),
                              ),
                            );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const Food(data: "Spaghetti"),
                              ),
                            );
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
class Food extends StatelessWidget {
  final String data;
  const Food({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('$data - Details'),
      ),
      body: data == "Pimento Cheese Sandwich" ? SandwichDisplay():
      data == "Burger" ? BurgerDisplay():
      data == "Spaghetti" ? SpaghettiDisplay(): Text("No data"),
    );    
  }
}

class SandwichDisplay extends StatelessWidget {
  const SandwichDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pimento Cheese Sandwich Recipe", 
            style: TextStyle (fontSize: 32),),
              Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Center( child:Text("Pimento Cheese Sandwich Ingredients", 
                    style: TextStyle (fontSize: 24, fontWeight: FontWeight.bold,),),)
                  ),
                  ListTile(
                    title: Center(child: Text("Bread")),
                  ),
                  ListTile(
                    title: Center(child: Text("Pimento Cheese Spread")),
                  ),
                  ListTile(
                    title: Center( child:Text("How to make it: ", 
                    style: TextStyle (fontSize: 24, fontWeight: FontWeight.bold,),),)
                  ),
                ],
              ),
              ),
              Container (
                width: 600,
                color: const Color.fromARGB(255, 247, 255, 200),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                  ListTile(
                    title: Text('1. Place down 2 slices of bread'),
                  ),
                  ListTile(
                    title: Text('2. Using a knife or spoon, add the desired amount of pimento cheese to one slice of bread'),
                  ),
                  ListTile(
                    title: Text('3. Spread the pimento cheese over the top surface of the bread then place the other slice on top'),
                  ),
                  ]
                ),
              ),
              SizedBox(height: 20),
              Image.network (
                'data:image/jpeg;base64,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'
                ),
              SizedBox(height: 20),
          ],
        ),
      )
    );
  }
}

class BurgerDisplay extends StatelessWidget {
  const BurgerDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pimento Cheese Sandwich Recipe", 
            style: TextStyle (fontSize: 32),),
              Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Center( child:Text("Pimento Cheese Sandwich Ingredients", 
                    style: TextStyle (fontSize: 24, fontWeight: FontWeight.bold,),),)
                  ),
                  ListTile(
                    title: Center(child: Text("Bread")),
                  ),
                  ListTile(
                    title: Center(child: Text("Pimento Cheese Spread")),
                  ),
                  ListTile(
                    title: Center( child:Text("How to make it: ", 
                    style: TextStyle (fontSize: 24, fontWeight: FontWeight.bold,),),)
                  ),
                ],
              ),
              ),
              Container (
                width: 600,
                color: const Color.fromARGB(255, 247, 255, 200),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                  ListTile(
                    title: Text('1. Place down 2 slices of bread'),
                  ),
                  ListTile(
                    title: Text('2. Using a knife or spoon, add the desired amount of pimento cheese to one slice of bread'),
                  ),
                  ListTile(
                    title: Text('3. Spread the pimento cheese over the top surface of the bread then place the other slice on top'),
                  ),
                  ]
                ),
              ),
              SizedBox(height: 20),
              Image.network (
                'data:image/jpeg;base64,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'
                ),
              SizedBox(height: 20),
          ],
        ),
      )
    );
  }
}

class SpaghettiDisplay extends StatelessWidget {
  const SpaghettiDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pimento Cheese Sandwich Recipe", 
            style: TextStyle (fontSize: 32),),
              Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Center( child:Text("Pimento Cheese Sandwich Ingredients", 
                    style: TextStyle (fontSize: 24, fontWeight: FontWeight.bold,),),)
                  ),
                  ListTile(
                    title: Center(child: Text("Bread")),
                  ),
                  ListTile(
                    title: Center(child: Text("Pimento Cheese Spread")),
                  ),
                  ListTile(
                    title: Center( child:Text("How to make it: ", 
                    style: TextStyle (fontSize: 24, fontWeight: FontWeight.bold,),),)
                  ),
                ],
              ),
              ),
              Container (
                width: 600,
                color: const Color.fromARGB(255, 247, 255, 200),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                  ListTile(
                    title: Text('1. Place down 2 slices of bread'),
                  ),
                  ListTile(
                    title: Text('2. Using a knife or spoon, add the desired amount of pimento cheese to one slice of bread'),
                  ),
                  ListTile(
                    title: Text('3. Spread the pimento cheese over the top surface of the bread then place the other slice on top'),
                  ),
                  ]
                ),
              ),
              SizedBox(height: 20),
              Image.network (
                'data:image/jpeg;base64,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'
                ),
              SizedBox(height: 20),
          ],
        ),
      )
    );
  }
}

