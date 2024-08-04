import 'package:applicant_test_project/features/posts/posts_bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/widgets.dart';
import 'widgets/post_card.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc()..add(DownloadPostsEvent()),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            title: Text(
              title,
            ),
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(64), child: SearchWidget()),
          ),
          BlocConsumer<PostsBloc, PostsState>(
            listener: (context, state) {
              //обработка ошибок
            },
            builder: (context, state) {
              return (state is PostsInitial || state is PostsDownload)
                  ? const SliverCircProgressIndicator()
                  : (state is PostsLoaded && state.posts.isNotEmpty)
                      ? SliverList.builder(
                          itemCount: state.posts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return PostWidget(
                              post: state.posts[index],
                              onTap: () {
                                context.read<PostsBloc>().add(
                                    DownloadPostFullEvent(
                                        post: state.posts[index]));
                              },
                            );
                          },
                        )
                      : const SliverNoValues(
                          noValues: 'Нет постов!',
                        );
            },
          ),
        ],
      ),
    );
  }
}
