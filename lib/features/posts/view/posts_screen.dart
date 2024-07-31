import 'package:applicant_test_project/features/posts/posts_bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(64),
                child: SearchWidget()),
          ),
          BlocConsumer<PostsBloc, PostsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return (state is PostsInitial || state is PostsDownload)
                  ? const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(color: Colors.cyan,)))
                  : SliverList.builder(
                      itemCount: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                          height: 40,
                          decoration: BoxDecoration(color:  Colors.cyan),

                        );
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
