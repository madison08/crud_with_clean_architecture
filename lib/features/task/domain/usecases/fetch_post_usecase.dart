import 'package:crud_with_clean_architecture/core/error/failures.dart';
import 'package:crud_with_clean_architecture/features/task/data/models/post.dart';
import 'package:crud_with_clean_architecture/features/task/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class FetchPostUsecase {
  final PostRepository repository;

  FetchPostUsecase({required this.repository});

  Future<Either<Failure, Post>> call(String id) async {
    return await repository.fetch(id);
  }
}
