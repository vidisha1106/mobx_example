import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/GitHub%20Repos/github_repos_store.dart';
import 'package:provider/provider.dart';

class GitHubReposExample extends StatelessWidget {
  GitHubReposExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GitHub Repos Example", style: TextStyle(fontSize: 25)),
      ),
      body: Column(
        children: [
          UserInput(),
          ShowError(),
          LoadingIndicator(),
        ],
      ),
    );
  }
}

class UserInput extends StatelessWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gitHUbReposStore = Provider.of<GitHubRepos>(context);
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextField(
        autofocus: true,
        onSubmitted: (value) {
          gitHUbReposStore.setUser(value);
          gitHUbReposStore.fetchRepos();
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
  const ShowError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gitHubReposStore = Provider.of<GitHubRepos>(context);
    return Observer(
      builder: (_) =>
          gitHubReposStore.fetchReposFuture.status == FutureStatus.rejected ?
      Row(
        children: [
          Icon(Icons.error,color: Colors.red,size: 15),
          Text("Failed to fetch Repos for",style: TextStyle(color: Colors.red,fontSize: 10),),
          Text("${gitHubReposStore.user}")
        ],
      ) : Container()
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
    },);
  }
}

