import 'package:flutter/material.dart';
import 'package:simple_posts_viewer/views/posts_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text("Home"),),
    body: Center(child: ElevatedButton(onPressed: () => {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PostsPage()))
    }, child: const Text("View Posts"))),
    );
  }
}