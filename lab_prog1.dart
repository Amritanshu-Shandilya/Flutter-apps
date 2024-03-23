import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab Program 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lab Program 1'),
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
  String text = 'This is the sample text';
  double _fontSize = 20.0;
  int colorIndex = -1;
  
  final colorList = [Colors.red, Colors.blue, Colors.green];

  void _increaseFontSize(){
    setState(() {
      _fontSize = _fontSize + 5;

      if (_fontSize == 80){
        _fontSize = 20;
      }

    });
  }

  void _changeFontColour(){
    setState(() {
      colorIndex ++;
      if (colorIndex > 2){
        colorIndex = 0;
      }
    });
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontSize: _fontSize, 
                color: colorList[colorIndex]
              )
            ),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton.extended(
                  label: const Text("Increase font size"),
                  onPressed: _increaseFontSize,
                  tooltip: 'Increase Font Size'
                ),

                FloatingActionButton.extended(
                  label: const Text("Change Text Colour"),
                  onPressed: _changeFontColour,
                  tooltip: 'Change Font Color'
                ),
              ],
            ),
          ],
        ),
      ),

      );

  }
}
