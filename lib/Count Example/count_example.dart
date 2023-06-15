import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/Count%20Example/counter.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  final Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Count Example", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Increment",
                    style: TextStyle(fontSize: 20),
                  ),
                  Observer(
                    builder: (_) {
                      return Text(
                        '${counter.count1}',
                        style: TextStyle(fontSize: 25),
                      );
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Decrement",
                    style: TextStyle(fontSize: 20),
                  ),
                  Observer(
                    builder: (_) {
                      return Text(
                        '${counter.count2}',
                        style: TextStyle(fontSize: 25),
                      );
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  Observer(
                    builder: (_) {
                      return Text(
                        '${counter.total}',
                        style: TextStyle(fontSize: 25),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: UniqueKey(),
            onPressed: counter.increment,
            child: Icon(Icons.add),
          ),
          SizedBox(width: 25),
          FloatingActionButton(
            key: UniqueKey(),
            onPressed: counter.decrement,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
