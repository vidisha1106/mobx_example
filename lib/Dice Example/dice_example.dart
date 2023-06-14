import 'package:flutter/material.dart';

class DiceExample extends StatelessWidget {
  const DiceExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Dice Example", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
    );
  }
}
