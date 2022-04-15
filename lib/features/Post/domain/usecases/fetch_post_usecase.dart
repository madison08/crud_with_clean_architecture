import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/post.dart';
import '../repositories/post_repository.dart';

class FetchPostUsecase {
  final PostRepository repository;

  FetchPostUsecase({required this.repository});

  Future<Either<Failure, Post>> call(String id) async {
    return await repository.fetch(id);
  }
}
