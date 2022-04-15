import '../../../../core/network/network_service.dart';
import '../models/post.dart';

abstract class PostRepositoryDataSource {
  Future<List<Post>> fetchAll();
  Future<Post> fetch(String id);
  Future<Post> add(Post params);
  Future<Post> update(Post params);
  Future<Post> delete(Post params);
}

class PostRemoteDataSourceImpl extends PostRepositoryDataSource {
  @override
  Future<Post> add(Post params) async {
    var response = await (params.id != null
        ? NetworkService.put('posts', params.id!, params.toJson())
        : NetworkService.post('posts', params.toJson()));

    if (response == null) return params;
    return Post.fromJson(response.data);
  }

  @override
  Future<Post> delete(Post params) async {
    await NetworkService.delete('posts', params.id ?? '');
    return params;
  }

  @override
  Future<Post> fetch(String id) async {
    var response = await NetworkService.getById('posts', id);

    return Post.fromJson(response.data);
  }

  @override
  Future<List<Post>> fetchAll() async {
    var response = await NetworkService.get('posts');

    List<Post> datas = [];

    response.data.forEach((item) {
      datas.add(Post.fromJson(item));
    });

    return datas;
  }

  @override
  Future<Post> update(Post params) async {
    await NetworkService.put('posts', params.id!, params.toJson());

    return params;
  }
}
