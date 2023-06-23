import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/Todos%20Example/todo_list.dart';
import 'package:provider/provider.dart';

class TodosExample extends StatelessWidget {
  TodosExample({Key? key}) : super(key: key);

  // final todolist = TodoList();
  final textController = TextEditingController(text: '');
  final FocusNode textFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Todos Example", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Observer(
              builder: (_) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: todoList.todos.length,
                  itemBuilder: (context, index) {
                    return Observer(builder: (_) {
                      return ListTile(
                        title: Text(todoList.todos[index].title),
                        trailing: IconButton(
                          onPressed: () {
                            todoList.removeTodo(todoList.todos[index]);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        leading: Checkbox(
                          value: todoList.todos[index].completed,
                          onChanged: (value) {
                            todoList.todoCompletion(index, value ?? false);
                          },
                        ),
                      );
                    });
                  },
                );
              },
            ),
            TextField(
              controller: textController,
              onSubmitted: (value) {
                todoList.addTodo(value);
                textController.clear();
                textFocus.requestFocus();
                // FocusScope.of(context).requestFocus(textFocus);
              },
              focusNode: textFocus,
              textInputAction: TextInputAction.done,
              autofocus: true,
              decoration: const InputDecoration(
                  hintText: "Add a Todo", contentPadding: EdgeInsets.all(16)),
            )
          ],
        ),
      ),
    );
  }
}
