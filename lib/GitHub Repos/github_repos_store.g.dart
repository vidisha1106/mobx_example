// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GitHubRepos on _GitHubReposStore, Store {
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: '_GitHubReposStore.hasData'))
      .value;

  late final _$futureFetchReposListAtom =
      Atom(name: '_GitHubReposStore.futureFetchReposList', context: context);

  @override
  ObservableFuture<List<Repository>> get futureFetchReposList {
    _$futureFetchReposListAtom.reportRead();
    return super.futureFetchReposList;
  }

  @override
  set futureFetchReposList(ObservableFuture<List<Repository>> value) {
    _$futureFetchReposListAtom.reportWrite(value, super.futureFetchReposList,
        () {
      super.futureFetchReposList = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_GitHubReposStore.user', context: context);

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$fetchReposAsyncAction =
      AsyncAction('_GitHubReposStore.fetchRepos', context: context);

  @override
  Future<List<Repository>> fetchRepos() {
    return _$fetchReposAsyncAction.run(() => super.fetchRepos());
  }

  late final _$_GitHubReposStoreActionController =
      ActionController(name: '_GitHubReposStore', context: context);

  @override
  void setUser(String text) {
    final _$actionInfo = _$_GitHubReposStoreActionController.startAction(
        name: '_GitHubReposStore.setUser');
    try {
      return super.setUser(text);
    } finally {
      _$_GitHubReposStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
futureFetchReposList: ${futureFetchReposList},
user: ${user},
hasData: ${hasData}
    ''';
  }
}
