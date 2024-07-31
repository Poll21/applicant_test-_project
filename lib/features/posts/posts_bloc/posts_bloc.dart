import 'package:applicant_test_project/features/posts/domain/posts.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<DownloadPostsEvent>((event, emit) async {
      emit(PostsDownload());
      const Duration(microseconds: 200);
      print('fsdfdfsdfsdf');
      emit(PostsLoaded(posts: Posts(posts: []), error: ''));
    });
  }
}
