import 'package:mobx/mobx.dart';
import 'package:github/github.dart';

part 'github_repos_store.g.dart';

class GitHubRepos = _GitHubReposStore with _$GitHubRepos;

abstract class _GitHubReposStore
    with Store {
  final GitHub gitHubClient = GitHub();

  //No need to observe this as we are relying on fetchReposFuture.status
  List<Repository> repositories = [];

  //We are starting with an empty Future to avoid null check
  @observable
  ObservableFuture<List<Repository>> fetchReposFuture = emptyResponse;

  static ObservableFuture<List<Repository>> emptyResponse = ObservableFuture
      .value([]);

  @computed
  bool get hasData =>
      fetchReposFuture != emptyResponse &&
          fetchReposFuture.status == FutureStatus.fulfilled;

  @observable
  String user = '';

  @action
  Future<List<Repository>> fetchRepos() async
  {
    repositories=[];
    final futureRepos=gitHubClient.repositories.listRepositories().toList();
    fetchReposFuture=ObservableFuture(futureRepos);
    return repositories=await fetchReposFuture;
  }

  @action
  void setUser(String text)
  {
    fetchReposFuture=emptyResponse;
    user=text;
  }

}
