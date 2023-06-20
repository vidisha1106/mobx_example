import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/Connectivity%20Example/connectivity_example.dart';
import 'package:mobx_example/Connectivity%20Example/connectivity_store.dart';
import 'package:mobx_example/Count%20Example/count_example.dart';
import 'package:mobx_example/Count%20Example/counter.dart';
import 'package:mobx_example/Dice%20Example/dice.dart';
import 'package:mobx_example/Dice%20Example/dice_example.dart';
import 'package:mobx_example/Form%20Example/form_example.dart';
import 'package:mobx_example/GitHub%20Repos/github_repos_example.dart';
import 'package:mobx_example/GitHub%20Repos/github_repos_store.dart';
import 'package:mobx_example/Hacker%20News/api_using_mobx_example.dart';
import 'package:mobx_example/Todos%20Example/todo_list.dart';
import 'package:mobx_example/Todos%20Example/todos_example.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Counter>(create: (_) {
          return Counter();
        },),
        Provider<Dice>(create: (_) {
          return Dice();
        },),
        Provider<TodoList>(create: (_) {
          return TodoList();
        },),
        Provider<ConnectivityStore>(create: (_) {
          return ConnectivityStore();
        },),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/MyHomePage',
        routes: {
          '/MyHomePage': (context) => MyHomePage(),
          '/CountExample': (context) => CountExample(),
          '/DiceExample': (context) => DiceExample(),
          '/TodosExample': (context) => TodosExample(),
          '/FormExample': (context) => FormExample(),
          '/ConnectivityExample': (context) => ConnectivityExample(),
          '/GitHubReposExample': (context) => GitHubReposExample(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("MobX", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
                pathName: '/CountExample', text: 'Count Example'),
            CustomElevatedButton(
                pathName: '/DiceExample', text: 'Dice Example'),
            CustomElevatedButton(
                pathName: '/TodosExample', text: 'Todos Example'),
            CustomElevatedButton(
                pathName: '/FormExample', text: 'Form Example'),
            CustomElevatedButton(
                pathName: '/ConnectivityExample', text: 'Connectivity Example'),
            CustomElevatedButton(
                pathName: '/GitHubReposExample', text: 'GitHub Repos Example'),
            CustomElevatedButton(
                pathName: '/HackerNewsExample', text: 'Hacker News Example'),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String pathName;
  final String text;

  const CustomElevatedButton({
    super.key,
    required this.pathName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, pathName);
        },
        child: Text(text, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
