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
              child: Container (
                width: 600,
                color: const Color.fromARGB(255, 247, 255, 200),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Pimento Cheese Sandwich'),
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
                        Text('Hamburgers'),
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
                        Text('Spaghetti'),
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
            Text("Burger Recipe", 
            style: TextStyle (fontSize: 32),),
              Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Center( child:Text("Burger Ingredients", 
                    style: TextStyle (fontSize: 24, fontWeight: FontWeight.bold,),),)
                  ),
                  ListTile(
                    title: Center(child: Text("Burger Buns")),
                  ),
                  ListTile(
                    title: Center(child: Text("Salt & Pepper")),
                  ),
                  ListTile(
                    title: Center(child: Text("1 1/2 Pounds Ground Beef (80% Lean)")),
                  ),
                  ListTile(
                    title: Center(child: Text("Butter or Oil")),
                  ),
                  ListTile(
                    title: Center(child: Text("Optional Toppings: Lettuce, Tomato, Pickles, Cheese, Onions, Ketchup, Mustard, etc.")),
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
                    title: Text('1. Divide ground beef into 4-6 portions'),
                  ),
                  ListTile(
                    title: Text('2. Press each portion into a 1-inch disk, press the middle to create a small dimple'),
                  ),
                  ListTile(
                    title: Text('3. Coat your pan with a teaspoon of oil over medium heat'),
                  ),
                  ListTile(
                    title: Text("4. Place burgers in hot pan and season with salt and pepper; cook for 3-4 minutes")),
                  ListTile(
                    title: Text("5. Use a spatula to flip the burgers and season with salt and pepper, optionally add cheese, cook for another 3-5 minutes")),
                  ListTile(
                    title: Text("6. Remove burgers from pan and place on bun, add toppings"),
                  ),
                  ]
                ),
              ),
              SizedBox(height: 20),
              Image.network (
                'data:image/jpeg;base64,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'),
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
            Text("Spaghetti Recipe", 
            style: TextStyle (fontSize: 32),),
              Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Center( child:Text("Spaghetti Ingredients", 
                    style: TextStyle (fontSize: 24, fontWeight: FontWeight.bold,),),)
                  ),
                  ListTile(
                    title: Center(child: Text("1 pound ground beef")),
                  ),
                  ListTile(
                    title: Center(child: Text("1 medium onion, chopped")),
                  ),
                  ListTile(
                    title: Center(child: Text("4 cloves garlic, minced")),
                  ),
                  ListTile(
                    title: Center(child: Text("1 small green bell pepper, diced")),
                  ),
                  ListTile(
                    title: Center(child: Text("1 (28 ounce) can diced tomatoes")),
                  ),
                  ListTile(
                    title: Center(child: Text("1 (16 ounce) can tomato sauce")),
                  ),
                  ListTile(
                    title: Center(child: Text("1 (6 ounce) can tomato paste")),
                  ),
                  ListTile(
                    title: Center(child: Text("2 teaspoons dried oregano")),
                  ),
                  ListTile(
                    title: Center(child: Text("2 teaspoons dried basil")),
                  ),
                  ListTile(
                    title: Center(child: Text("1 teaspoon salt")),
                  ),
                  ListTile(
                    title: Center(child: Text("1/2 teaspoon ground black pepper")),
                  ),
                  ListTile(
                    title: Center(child: Text("Pot with water")),
                  ),
                  ListTile(
                    title: Center(child: Text("1 box spaghetti noodles")),
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
                    title: Text('1. Add ground beef, onion, garlic, and green peppers to pan over medium-high heat. Stir until meat is browned and crumbly, 5-7 minutes. Drain grease'),
                  ),
                  ListTile(
                    title: Text('2. Stir in diced tomatoes, tomato sauce, tomato paste into the pan. Season with oregano, basil, salt, pepper. Simmer for 1 hour, stir occasionally'),
                  ),
                  ListTile(
                    title: Text('3. Place pot of water over high heat until boiling'),
                  ),
                  ListTile(
                    title: Text('4. Add spaghetti noodles to boiling water, stir occasionally, remove once cooked to al dente (firm but not crunchy)'),
                  ),
                  ListTile(
                    title: Text('5. Drain the spaghetti noodles and add to plate with sauce.'),
                  ),
                  ]
                ),
              ),
              SizedBox(height: 20),
              Image.network (
                'data:image/jpeg;base64,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'),
              SizedBox(height: 20),
          ],
        ),
      )
    );
  }
}

