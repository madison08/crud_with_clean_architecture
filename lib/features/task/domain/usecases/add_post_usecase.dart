import 'package:crud_with_clean_architecture/core/error/failures.dart';
import 'package:crud_with_clean_architecture/features/task/data/models/post.dart';
import 'package:crud_with_clean_architecture/features/task/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class AddPostUsecase {
  final PostRepository repository;

  AddPostUsecase({required this.repository});

  Future<Either<Failure, Post>> call(Post params) async {
    return await repository.add(params);
  }
}
