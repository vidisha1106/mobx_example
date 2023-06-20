import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/GitHub%20Repos/github_repos_store.dart';

class GitHubReposExample extends StatelessWidget {
  GitHubReposExample({Key? key}) : super(key: key);

  final GitHubRepos store = GitHubRepos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "GitHub Repos Example",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          UserInput(store),
          ShowError(store),
          LoadingIndicator(store),
          RepositoryListView(store)
        ],
      ),
    );
  }
}

class UserInput extends StatelessWidget {
  UserInput(this.store, {Key? key}) : super(key: key);

  final GitHubRepos store;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextField(
        autofocus: true,
        controller: textEditingController,
        style: TextStyle(
          fontSize: 20,
        ),
        onSubmitted: (value) {
            store.setUser(value);
            store.fetchRepos();
            textEditingController.clear();
        },
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.all(10),
          hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          hintText: "GitHub Account Name",
        ),
      ),
    );
  }
}

class ShowError extends StatelessWidget {
  const ShowError(this.store, {Key? key}) : super(key: key);

  final GitHubRepos store;

  @override
  Widget build(BuildContext context) => Observer(
      builder: (_) => store.futureFetchReposList.status == FutureStatus.rejected
          ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.warning,
                    color: Colors.deepOrange,size: 20,
                  ),
                  Container(
                    width: 8,
                  ),
                  const Text(
                    'Failed to fetch repos for',
                    style: TextStyle(color: Colors.deepOrange,fontSize: 20),
                  ),

                ],
              ),
              Text(
                store.user,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.deepOrange, fontWeight: FontWeight.bold),
              ),
            ],
          )
          : Container());
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator(this.store, {Key? key}) : super(key: key);
  final GitHubRepos store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.futureFetchReposList.status == FutureStatus.pending
          ? const LinearProgressIndicator()
          : Container(),
    );
  }
}

class RepositoryListView extends StatelessWidget {
  const RepositoryListView(this.store, {Key? key}) : super(key: key);
  final GitHubRepos store;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (_) {
          if (!store.hasData) {
            return Container();
          }
          if (store.repositories.isEmpty) {
            return Column(
              children: [
                Text(
                  "We could not find any repos for the user : ",
                  style: TextStyle(
                    fontSize: 20,
                      fontWeight: FontWeight.w500, color: Colors.grey),
                ),
                Text(
                  store.user,
                  style: TextStyle(
                    fontSize: 20,
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ],
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: store.repositories.length,
            itemBuilder: (BuildContext context, int index) {
              final repo = store.repositories[index];
              return ListTile(
                title: Row(
                  children: [
                    Text(
                      repo.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.purple,
                          fontSize: 15,
                          overflow: TextOverflow.fade),
                    ),
                    Text('(${repo.stargazersCount} ⭐️) '),
                  ],
                ),
                subtitle: Text(repo.description,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 10, color: Colors.purple)),
              );
            },
          );
        },
      ),
    );
  }
}
