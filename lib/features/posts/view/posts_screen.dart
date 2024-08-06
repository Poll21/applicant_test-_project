import 'package:applicant_test_project/service/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../posts.dart';


@RoutePage()
class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc()..add(DownloadPostsEvent()),
      child: AutoTabsRouter(
        routes: const [AllPostsRoute(), FullPostRoute(), AddPostRoute()],
        builder: (context, childRoute) {
          return childRoute;
        },
      ),
    );
  }
}
