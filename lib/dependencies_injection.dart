import 'package:crud_with_clean_architecture/features/Post/data/datasources/post_remote_data_source.dart';
import 'package:crud_with_clean_architecture/features/Post/data/repositories/post_repository_impl.dart';
import 'package:crud_with_clean_architecture/features/Post/domain/repositories/post_repository.dart';
import 'package:crud_with_clean_architecture/features/Post/domain/usecases/add_post_usecase.dart';
import 'package:crud_with_clean_architecture/features/Post/domain/usecases/delete_post_usecase.dart';
import 'package:crud_with_clean_architecture/features/Post/domain/usecases/fetch_post_usecase.dart';
import 'package:crud_with_clean_architecture/features/Post/domain/usecases/fetch_posts_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory<PostRemoteDataSourceImpl>(
      () => PostRemoteDataSourceImpl());
  getIt.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(remoteDataSource: getIt()));

  getIt.registerFactory(() => FetchPostUsecase(repository: getIt()));
  getIt.registerFactory(() => FetchPostsUsecase(repository: getIt()));
  getIt.registerFactory(() => AddPostUsecase(repository: getIt()));
  getIt.registerFactory(() => DeletePostUsecase(repository: getIt()));
}
