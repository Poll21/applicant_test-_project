part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();
}

final class PostsInitial extends PostsState {
  @override
  List<Object> get props => [];
}
final class PostsDownload extends PostsState {
  @override
  List<Object> get props => [];
}
final class PostsLoaded extends PostsState {
  final Posts posts;
  final String error;

  const PostsLoaded( {required this.posts, required this.error,});
  @override
  List<Object> get props => [posts, error];
}
