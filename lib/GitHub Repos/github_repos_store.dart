


import 'package:mobx/mobx.dart';
import 'package:github/github.dart';

part 'github_repos_store.g.dart';

class GitHubRepos = _GitHubReposStore with _$GitHubRepos;

abstract class _GitHubReposStore with Store {
  final GitHub gitHubClient = GitHub();

  //No need to observe this as we are relying on fetchReposFuture.status

  List<Repository> repositories = [];

  //We are starting with an empty Future to avoid null check
  @observable
  ObservableFuture<List<Repository>> futureFetchReposList = emptyResponse;

  static ObservableFuture<List<Repository>> emptyResponse =
      ObservableFuture.value([]);

  @observable
  String user = '';

  @computed
  bool get hasData =>
      futureFetchReposList != emptyResponse &&
      futureFetchReposList.status == FutureStatus.fulfilled;



  @action
  Future<List<Repository>> fetchRepos() async {
    repositories = [];
    final futureRepos = gitHubClient.repositories.listUserRepositories(user).toList();
    futureFetchReposList = ObservableFuture(futureRepos);
    return repositories = await futureFetchReposList;
  }

  @action
  void setUser(String text) {
    futureFetchReposList = emptyResponse;
    user = text;
  }
}
