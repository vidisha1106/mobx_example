import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/API%20Using%20MobX/api_model.dart';
import 'package:mobx_example/API%20Using%20MobX/api_store.dart';

class HackerNewsExample extends StatelessWidget {

  final ApiStore apiStore = ApiStore();

  HackerNewsExample({super.key}) {
    apiStore.getData();
  }

  @override
  Widget build(BuildContext context) {
    final futureList = apiStore.postListFuture;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Fetch Data From API",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Observer(
        builder: (_) {
          switch (futureList!.status) {
            case FutureStatus.pending:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case FutureStatus.rejected:
              return Center(
                child: Column(
                  children: [
                    const Text(
                      "Failed to load items ",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FilledButton(
                        onPressed: _refresh,
                        child: const Text(
                          "Tap to Retry",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              );
            case FutureStatus.fulfilled:
              final List<Post> posts = futureList.result;
              debugPrint(posts.toString());
              return RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return ListTile(
                        title: Text(post.title,maxLines: 2,overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple)),
                        style: ListTileStyle.list,
                        subtitle: Text(post.body,overflow: TextOverflow.ellipsis,maxLines: 3,
                          style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),),
                        contentPadding: const EdgeInsets.all(8),
                        leading: CircleAvatar(child: Text("${post.id}",),
                      ),);
                    },
                  ));
          }
        },
      ),
    );
  }

  Future _refresh() => apiStore.fetchData();
}
