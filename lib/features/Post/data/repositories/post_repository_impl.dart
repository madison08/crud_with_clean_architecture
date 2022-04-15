import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../datasources/post_remote_data_source.dart';
import '../models/post.dart';
import '../../domain/repositories/post_repository.dart';

// implementation of repository

class PostRepositoryImpl extends PostRepository {
  final PostRepositoryDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Post>> add(Post params) async {
    try {
      final response = await remoteDataSource.add(params);

      return Right(response);
    } catch (error) {
      return Left(ServerException(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Post>> delete(Post params) async {
    try {
      final response = await remoteDataSource.delete(params);

      return Right(response);
    } catch (error) {
      return Left(ServerException(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Post>> fetch(String id) async {
    try {
      final response = await remoteDataSource.fetch(id);
      return Right(response);
    } catch (error) {
      return Left(ServerException(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Post>>> fetchAll() async {
    try {
      final response = await remoteDataSource.fetchAll();

      return Right(response);
    } catch (error) {
      return Left(ServerException(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Post>> update(Post params) async {
    try {
      final response = await remoteDataSource.update(params);

      return Right(response);
    } catch (error) {
      return Left(ServerException(message: error.toString()));
    }
  }
}
