import 'package:flutter/material.dart';

class HackerNewsExample extends StatelessWidget {
  const HackerNewsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hacker News Example",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
