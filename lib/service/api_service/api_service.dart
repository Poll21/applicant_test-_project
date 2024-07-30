import 'package:dio/dio.dart';

class ApiService{
  final Dio _dio = Dio();
  static const String _host = 'https://jsonplaceholder.typicode.com';
  Future<Response<dynamic>> get({required String path}) async {
    final requst =
    await _dio.get(_host + path);
    return requst;

  } Future<dynamic> post({required String path, dynamic form}) async {
    final requst =
    await _dio.post(_host + path, data: form);
    return requst;
  }
}
class ApiPosts{
  //получение постов
  Future<Response<dynamic>> getPosts() async {
    String path =
        "/posts";
    final requst = await ApiService().get(path: path);
    return requst;
  }
  //получение фото
  Future<Response<dynamic>> getPhotos() async {
    String path =
        "/photos";
    final requst = await ApiService().get(path: path);
    return requst;
  }
  //получение поста
  Future<dynamic> getPost({required String id}) async {
    String path =
        "/posts/$id";
    dynamic requst = await ApiService().get(path: path);
    return requst;
  }
  //получение Комментариев поста
  Future<Response<dynamic>> getCommitsPost({required String postId}) async {
    String path =
        "/comments/$postId/comments";
    dynamic requst = await ApiService().get(path: path);
    return requst;
  }

}