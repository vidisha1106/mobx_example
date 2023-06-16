import 'package:mobx/mobx.dart';
import 'package:mobx_example/Todos%20Example/todos.dart';
part 'todo_list.g.dart';
enum Visibility {all,pending,completed}

class TodoList = _TodoList with _$TodoList;

abstract class _TodoList with Store
{
   @observable
  ObservableList<Todos> todos=ObservableList<Todos>();

   @observable
    Visibility visibility=Visibility.all;
}