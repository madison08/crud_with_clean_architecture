import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/post.dart';
import '../repositories/post_repository.dart';

class FetchPostsUsecase {
  final PostRepository repository;

  FetchPostsUsecase({required this.repository});

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.fetchAll();
  }
}
