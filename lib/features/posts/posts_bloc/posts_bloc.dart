import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../service/service.dart';
import '../domain/domain.dart';

part 'posts_event.dart';

part 'posts_state.dart';

final _api = ApiPosts();

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    List<String> _errorsList =
        []; //хранит инфорьфцию об ошибках загрузки из Api
    //функция получения постов
    Future<List<Post>> _getPosts() async {
      List<Post>? _posts;
      final _resultPosts = await _api.getPosts();
      if (_resultPosts.statusCode == 200) {
        _posts = Posts.fromJson({"posts": _resultPosts.data}).posts;
      } else {
        if (_resultPosts.statusMessage != null) {
          _errorsList.add(_resultPosts.statusMessage!.toString());
        }
      }
      return _posts ?? [];
    }

    //функция получения коментариев
    Future<List<Comment>> _getComment(String _postId) async {
      List<Comment>? _commets; //коментарии к посту

      //получаем список комментариев
      final _resultCont = await _api.getCommetsPost(postId: _postId);
      if (_resultCont.statusCode == 200) {
        _commets = Comments.fromJson({"comments": _resultCont.data}).comments;
      } else {
        if (_resultCont.statusMessage != null) {
          _errorsList.add(_resultCont.statusMessage!.toString());
        }
      }

      return _commets ?? [];
    }

    //функция получения информации об пользователе
    Future<User?> _getUser(String _userId) async {
      User? _user;

      final _resultUser = await _api.getUser(id: _userId);
      if (_resultUser.statusCode == 200) {
        _user = User.fromJson(_resultUser.data);
      } else {
        if (_resultUser.statusMessage != null) {
          _errorsList.add(_resultUser.statusMessage!.toString());
        }
      }
      //получаем информацию об авторе
      return _user;
    }

    //функция сбора всех ошибок загрузки данных
    String _errorsStat() {
      String _errors = '';
      if (_errorsList.isNotEmpty) {
        _errorsList.forEach((e) => '$_errors; $e');
      }
      return _errors;
    }

    on<DownloadPostsEvent>((event, emit) async {
      _errorsList = []; //зачищаем ошибку стейта
      emit(PostsDownload());
      try {
        final _posts = await _getPosts();
        emit(PostsLoaded(
          posts: _posts,
          error: _errorsStat(),
          postFull: null,
        ));
      } catch (e) {
        emit(PostsLoaded(
          posts: [],
          error: e.toString(),
          postFull: null,
        ));
      }
    });

    on<DownloadPostFullEvent>((event, emit) async {
      _errorsList = []; //зачищаем ошибку стейта
      emit(PostsDownload());
      try {
        final _posts = await _getPosts();//нежен ли??
        final _comments = await _getComment(event.post.id.toString());
        final _user = await _getUser(event.post.userId.toString());
        emit(PostsLoaded(
            posts: _posts,
            error:  _errorsStat(),
            postFull: PostFull(
                post: event.post,
                comments: _comments,
                user: _user ?? userInit)));
      } catch (e) {
        emit(PostsLoaded(posts: [], error: e.toString(), postFull: null));
      }
    });
  }
}
