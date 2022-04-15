import 'package:crud_with_clean_architecture/features/task/data/models/post.dart';
import 'package:dartz/dartz.dart';
import 'package:crud_with_clean_architecture/core/error/failures.dart';
import 'package:crud_with_clean_architecture/features/task/domain/repositories/post_repository.dart';

class DeletePostUsecase {
  final PostRepository repository;

  DeletePostUsecase({required this.repository});

  Future<Either<Failure, Post>> call(Post params) async {
    return await repository.delete(params);
  }
}
