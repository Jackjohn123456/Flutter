import 'package:flutter/material.dart';
import 'sent.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Typing Speed Test"), Icon(Icons.more_vert)]),
        backgroundColor: Color.fromARGB(255, 246, 112, 49),
      ),
      body: Sentence(),
    );
  }
}

void main() {
  runApp(MyApp());
}
