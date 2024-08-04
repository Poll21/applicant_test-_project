part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();
}

class DownloadPostsEvent extends PostsEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class DownloadPostFullEvent  extends PostsEvent{
  final Post post;
  const DownloadPostFullEvent({required this.post});
  @override
  List<Object?> get props => throw UnimplementedError();
}