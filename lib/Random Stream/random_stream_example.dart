import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/Random%20Stream/random_stream_store.dart';

class RandomStreamExample extends StatefulWidget {
  const RandomStreamExample({super.key});

  @override
  State<RandomStreamExample> createState() => _RandomStreamExampleState();
}

class _RandomStreamExampleState extends State<RandomStreamExample> {
  RandomStreamStore randomStreamStore = RandomStreamStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Stream Example", style: TextStyle(fontSize: 25)),
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            autorun((_) {
              debugPrint(randomStreamStore.randomStream!.value.toString());
            },);
            return Text("${randomStreamStore.randomStream!.value}",
                style:
                const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold,fontSize: 50));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    randomStreamStore.dispose();
    super.dispose();
  }
}
