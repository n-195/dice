import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          title: const Center(child: Text('Dicee')),
          backgroundColor: Colors.red[300],
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  void changeFace() {
    setState(() {
      // nextInt will provide output from 0 to 5 and we need 1 to 6
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                // if we update the variable outside the setState, then the
                // variable will be updated but we won't be able to achieve the
                // desired result, where image should change with the value of
                // the variable.
                // How setState works is it marks certain things as dirty, things
                // that are modified and rebuilds the code, wherever that change
                // needs to be reflected.
                changeFace();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/dice$leftDiceNum.png'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                changeFace();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/dice$rightDiceNum.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
