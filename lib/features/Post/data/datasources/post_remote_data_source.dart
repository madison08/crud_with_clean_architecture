import '../../../../core/network/network_service.dart';
import '../models/post.dart';

const uri = 'https://x8ki-letl-twmt.n7.xano.io/api:aGRFFROk';

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
        ? NetworkService.put(
            '$uri/posts', params.id.toString(), params.toJson())
        : NetworkService.post('$uri/posts', params.toJson()));

    if (response == null) return params;
    return Post.fromJson(response.data);
  }

  @override
  Future<Post> delete(Post params) async {
    await NetworkService.delete('$uri/posts', params.id.toString());
    return params;
  }

  @override
  Future<Post> fetch(String id) async {
    var response = await NetworkService.getById('$uri/posts', id);

    return Post.fromJson(response.data);
  }

  @override
  Future<List<Post>> fetchAll() async {
    var response = await NetworkService.get('$uri/posts');

    return response.map((data) {
      return Post.fromJson(data);
    }).toList();

    // List<Post> datas = [];

    print('pppppp');
    print(response);

    // response.data.forEach((item) {
    //   datas.add(Post.fromJson(item));
    // });

    // return datas;
  }

  @override
  Future<Post> update(Post params) async {
    await NetworkService.put(
        '$uri/posts', params.id.toString(), params.toJson());

    return params;
  }
}
