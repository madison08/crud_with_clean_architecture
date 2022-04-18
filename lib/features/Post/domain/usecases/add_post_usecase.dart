import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/post.dart';
import '../repositories/post_repository.dart';

class AddPostUsecase {
  final PostRepository repository;

  AddPostUsecase({required this.repository});

  Future<Either<Failure, Post>> call(Post params) async {
    return await repository.add(params);
  }
}
