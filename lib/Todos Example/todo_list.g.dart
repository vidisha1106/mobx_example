// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoList on _TodoList, Store {
  late final _$todosAtom = Atom(name: '_TodoList.todos', context: context);

  @override
  ObservableList<Todos> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<Todos> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$_TodoListActionController =
      ActionController(name: '_TodoList', context: context);

  @override
  void addTodo(String title) {
    final _$actionInfo =
        _$_TodoListActionController.startAction(name: '_TodoList.addTodo');
    try {
      return super.addTodo(title);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(Todos todo) {
    final _$actionInfo =
        _$_TodoListActionController.startAction(name: '_TodoList.removeTodo');
    try {
      return super.removeTodo(todo);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void todoCompletion(int index, bool value) {
    final _$actionInfo = _$_TodoListActionController.startAction(
        name: '_TodoList.todoCompletion');
    try {
      return super.todoCompletion(index, value);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos}
    ''';
  }
}
