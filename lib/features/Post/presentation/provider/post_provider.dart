import 'package:crud_with_clean_architecture/core/error/failures.dart';
import 'package:crud_with_clean_architecture/features/Post/data/models/post.dart';
import 'package:crud_with_clean_architecture/features/Post/domain/usecases/add_post_usecase.dart';
import 'package:crud_with_clean_architecture/features/Post/domain/usecases/delete_post_usecase.dart';
import 'package:crud_with_clean_architecture/features/Post/domain/usecases/fetch_post_usecase.dart';
import 'package:crud_with_clean_architecture/features/Post/domain/usecases/fetch_posts_usecase.dart';
import 'package:flutter/widgets.dart';

class PostProvider extends ChangeNotifier {
  final FetchPostsUsecase fetchPostsUsecase;
  final FetchPostUsecase fetchPostUsecase;
  final AddPostUsecase addPostUsecase;
  final DeletePostUsecase deletePostUsecase;

  Failure? error;

  List<Post> posts = [];

  PostProvider(
      {required this.fetchPostUsecase,
      required this.fetchPostsUsecase,
      required this.addPostUsecase,
      required this.deletePostUsecase});
}
