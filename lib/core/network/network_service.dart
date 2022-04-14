import 'package:http/http.dart' as http;

class NetworkService {
  var url = 'https://x8ki-letl-twmt.n7.xano.io/api:aGRFFROk';

  static Future<dynamic> post(String path, Map<String, dynamic> params) async {
    var data = await http.post(Uri.parse(path));

    return data;
  }

  static Future<dynamic> getById(String path, String id) async {
    // final uri = Uri.https();
    final uri = Uri.parse(path);
    var finalUri = uri.replace(queryParameters: {'id': id});

    var data = await http.get(finalUri);

    return data;
  }

  static Future<dynamic> get(String path) async {
    var data = await http.get(Uri.parse(path));

    return data;
  }

  static Future<dynamic> delete(String path, String id) async {
    final uri = Uri.parse(path);
    var finalUri = uri.replace(queryParameters: {'id': id});

    var data = await http.delete(finalUri);

    return data;
  }

  static Future<dynamic> put(String path, String id) async {
    final uri = Uri.parse(path);
    var finalUri = uri.replace(queryParameters: {'id': id});

    var data = await http.put(finalUri);

    return data;
  }
}