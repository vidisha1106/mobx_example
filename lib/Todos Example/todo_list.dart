import 'package:mobx/mobx.dart';
import 'package:mobx_example/Todos%20Example/todos.dart';

part 'todo_list.g.dart';

class TodoList = _TodoList with _$TodoList;

abstract class _TodoList with Store {
  @observable
  ObservableList<Todos> todos = ObservableList<Todos>();

  @action
  void addTodo(String title) {
    final todo = Todos(title, false);
    todos.add(todo);
  }

  @action
  void removeTodo(Todos todo) {
    todos.remove(todo);
    // todos.removeAt(index);
  }

  @action
  void todoCompletion(int index,bool value) {
    todos[index].completed=value;
  }
}
