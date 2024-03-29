import '../../../../core/error/failures.dart';
import '../../data/models/post.dart';
import '../../domain/usecases/add_post_usecase.dart';
import '../../domain/usecases/delete_post_usecase.dart';
import '../../domain/usecases/fetch_post_usecase.dart';
import '../../domain/usecases/fetch_posts_usecase.dart';
import 'package:flutter/widgets.dart';

enum PostLoadingState {
  initial,
  loading,
  fetchingAll,
  fetching,
  finished,
  error,
  adding,
  deleting,
}

class PostProvider extends ChangeNotifier {
  final FetchPostsUsecase fetchPostsUsecase;
  final FetchPostUsecase fetchPostUsecase;
  final AddPostUsecase addPostUsecase;
  final DeletePostUsecase deletePostUsecase;

  Failure? error;

  PostLoadingState loadingState = PostLoadingState.initial;

  List<Post> posts = [];

  PostProvider(
      {required this.fetchPostUsecase,
      required this.fetchPostsUsecase,
      required this.addPostUsecase,
      required this.deletePostUsecase});

  Future<void> fetchPosts() async {
    print('EEEENTTTERRR');

    error = null;

    loadingState = PostLoadingState.fetchingAll;
    notifyListeners();

    final response = await fetchPostsUsecase();
    response.fold((l) {
      loadingState = PostLoadingState.error;
      print(l.message);
    }, (r) {
      loadingState = PostLoadingState.finished;
      // posts.add(r);
      posts = r;
      print(r);
    });

    notifyListeners();
  }
}
