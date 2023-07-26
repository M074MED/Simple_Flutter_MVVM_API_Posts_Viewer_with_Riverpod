import 'package:simple_posts_viewer/models/post_model.dart';
import 'package:simple_posts_viewer/repositories/posts/posts_repository.dart';

class LocalPostsRepo extends PostsRepository {
  @override
  Future<List<Post>>? getAllPosts() {
    return null;
  }
}