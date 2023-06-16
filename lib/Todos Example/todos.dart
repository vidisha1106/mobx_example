import 'package:mobx/mobx.dart';

part 'todos.g.dart';

class Todos = _Todos with _$Todos;

abstract class _Todos with Store {
  _Todos(this.title, this.completed);

  @observable
  String title;

  @observable
  bool completed;
}
