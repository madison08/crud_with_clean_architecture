import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/post.dart';

// deinition de repository

abstract class PostRepository {
  Future<Either<Failure, Post>> add(Post params);
  Future<Either<Failure, List<Post>>> fetchAll();
  Future<Either<Failure, Post>> fetch(String id);
  Future<Either<Failure, Post>> update(String id);
  Future<Either<Failure, Post>> delete(Post params);
}
