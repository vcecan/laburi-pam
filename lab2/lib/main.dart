import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'word contains character counter',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This variable holds the text typeed by the user
  String enteredText = '';
  List splitted = [];
  int counter = 0;
  //var splitted = List.empty(growable: true);
  get string => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('word contains character counter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: TextField(
            onChanged: (value) {
              setState(() {
                enteredText = value;
                splitted = enteredText.split(' ');
                counter = 0;
                splitted.forEach((item) {
    if(item.contains('a')  || item.contains('A')){
      counter+=1;
      }}); 
              });
            },
            decoration: InputDecoration(
                labelText: 'Your text',
                border: const OutlineInputBorder(),
                // Display the number of entered characters
                counterText: '${counter.toString()} cuvinte contin litera "a"'),
          ),
        ),
      ),
    );
  }
}