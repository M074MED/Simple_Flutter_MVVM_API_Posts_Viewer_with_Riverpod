import 'package:dio/dio.dart';
import 'package:simple_posts_viewer/models/post_model.dart';
import 'package:simple_posts_viewer/repositories/posts/posts_repository.dart';

class APIPostsRepo extends PostsRepository {
  @override
  Future<List<Post>>? getAllPosts() async {
    List<Post> posts = [];
    try {
    var response =
        await Dio().get("https://jsonplaceholder.typicode.com/posts");
    
    var data = response.data as List;
    posts = data.map((post) => Post.fromJson(post)).toList();
    } catch (e) {
      print(e.toString());
    }
    return posts;
  }
}
