import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_posts_viewer/models/post_model.dart';
import 'package:simple_posts_viewer/repositories/posts/api_posts.dart';
import 'package:simple_posts_viewer/repositories/posts/posts_repository.dart';

final postsProvider = ChangeNotifierProvider.autoDispose((ref) =>
    PostsViewModel(postsRepository: APIPostsRepo())); // Dependency injection

class PostsViewModel extends ChangeNotifier {
  PostsRepository? postsRepository;
  Future<List<Post>>? allPosts;

  PostsViewModel({required postsRepository}) {
    getPosts(postsRepository);
  }

  Future<List<Post>>? getPosts(postsRepository) {
    allPosts = postsRepository.getAllPosts();
    notifyListeners();
    return allPosts;
  }
}
