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
  final List<Post> posts;
  final PostFull? postFull;
  final String error;

  const PostsLoaded({
    required this.posts,
    required this.error,
    required this.postFull,
  });

  @override
  List<Object> get props => [posts, error];

  PostsLoaded copyWith({
    List<Post>? posts,
    PostFull? postFull,
    String? error,
  }) {
    return PostsLoaded(
      posts: posts ?? this.posts,
      error: error ?? '',
      postFull: postFull,
    );
  }
}

final userInit = User(id: 0,
    name: 'Not',
    username: 'Not',
    email: 'Not',
    address: Address(street: '',
      suite: '',
      city: '',
      zipcode: '',
      geo: Geo(lat: '', lng: ''),),
    phone: 'Not',
    website: 'Not',
    company: Company(name: '', catchPhrase: '', bs: ''));