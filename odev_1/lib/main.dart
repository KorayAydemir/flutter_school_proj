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
        useMaterial3: true,
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
class ImageUrlInput extends StatelessWidget {
  const ImageUrlInput({super.key, required this.onInput});
  final void Function(String input) onInput;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // event handler
      onChanged: onInput,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter a search term',
      ),
    );
  }
}

class DisplayImage extends StatelessWidget {
  const DisplayImage({super.key, required this.input});

  final String input;

  @override
  Widget build(BuildContext context) {
    return Image.network(input);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String enteredInput = '';

  void onInput(String input) {
    setState(() {
      enteredInput = input;
    });
    print('input:  $input');
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
            ImageUrlInput(onInput: onInput),
            DisplayImage(input: enteredInput),
          ],
        ),
      ),
    );
  }
}