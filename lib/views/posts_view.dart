import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_posts_viewer/view_models/posts_view_model.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, watch, child) {
            var posts = watch.read(postsProvider).allPosts;
            return FutureBuilder(
                future: posts,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.lightBlueAccent,
                            radius: 15,
                            child: Text(
                              snapshot.data![index].id.toString(),
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                          ),
                          title: Text(
                            snapshot.data![index].title!,
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle: Text(
                            snapshot.data![index].body!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    );
                  }
                });
          },
        ),
      ),
    );
  }
}
