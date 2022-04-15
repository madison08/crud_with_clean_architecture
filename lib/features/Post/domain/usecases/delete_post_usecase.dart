import 'package:dartz/dartz.dart';

import '../../data/models/post.dart';
import '../../../../core/error/failures.dart';
import '../repositories/post_repository.dart';

class DeletePostUsecase {
  final PostRepository repository;

  DeletePostUsecase({required this.repository});

  Future<Either<Failure, Post>> call(Post params) async {
    return await repository.delete(params);
  }
}
