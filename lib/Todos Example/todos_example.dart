import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/Todos%20Example/todo_list.dart';

class TodosExample extends StatelessWidget {
  TodosExample({Key? key}) : super(key: key);

  final todolist = TodoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Todos Example", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: todolist.todos.length,
                itemBuilder: (context, index) {
                  return Observer(builder: (_) {
                    return ListTile(
                      title: Text(todolist.todos[index].title),
                      trailing: IconButton(
                        onPressed: () {
                          todolist.removeTodo(todolist.todos[index]);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      leading: Checkbox(
                        value: todolist.todos[index].completed,
                        onChanged: (value) {
                          todolist.todoCompletion(index, value ?? false);
                        },
                      ),
                    );
                  });
                },
              );
            },
          ),
          TextField(
            onSubmitted: (value) {
              return todolist.addTodo(value);
            },
            decoration: InputDecoration(
                hintText: "Add a Todo", contentPadding: EdgeInsets.all(16)),
          )
        ],
      ),
    );
  }
}
