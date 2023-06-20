// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApiStore on _ApiStore, Store {
  late final _$postListFutureAtom =
      Atom(name: '_ApiStore.postListFuture', context: context);

  @override
  ObservableFuture<List<Post>>? get postListFuture {
    _$postListFutureAtom.reportRead();
    return super.postListFuture;
  }

  @override
  set postListFuture(ObservableFuture<List<Post>>? value) {
    _$postListFutureAtom.reportWrite(value, super.postListFuture, () {
      super.postListFuture = value;
    });
  }

  late final _$_ApiStoreActionController =
      ActionController(name: '_ApiStore', context: context);

  @override
  Future<dynamic> fetchData() {
    final _$actionInfo =
        _$_ApiStoreActionController.startAction(name: '_ApiStore.fetchData');
    try {
      return super.fetchData();
    } finally {
      _$_ApiStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postListFuture: ${postListFuture}
    ''';
  }
}
