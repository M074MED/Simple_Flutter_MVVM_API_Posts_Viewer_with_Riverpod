import 'package:simple_posts_viewer/models/post_model.dart';

abstract class PostsRepository {
  Future<List<Post>>? getAllPosts();
}
