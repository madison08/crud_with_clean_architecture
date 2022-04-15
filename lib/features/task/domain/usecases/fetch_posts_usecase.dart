import 'package:crud_with_clean_architecture/core/error/failures.dart';
import 'package:crud_with_clean_architecture/features/task/data/models/post.dart';
import 'package:crud_with_clean_architecture/features/task/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class FetchPostsUsecase {
  final PostRepository repository;

  FetchPostsUsecase({required this.repository});

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.fetchAll();
  }
}
