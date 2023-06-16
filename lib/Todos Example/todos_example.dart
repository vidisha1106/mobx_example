import 'package:flutter/material.dart';

class TodosExample extends StatelessWidget {
  const TodosExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Todos Example", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
    );
  }
}
