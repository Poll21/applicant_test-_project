import 'package:applicant_test_project/features/posts/posts_bloc/posts_bloc.dart';
import 'package:applicant_test_project/widgets/sliver_circ_progress_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/service.dart';
import '../../../widgets/widgets.dart';
import 'widgets/post_card.dart';
@RoutePage()
class FullPostScreen extends StatefulWidget {
  const FullPostScreen({super.key});

  @override
  State<FullPostScreen> createState() => _FullPostScreenState();
}

class _FullPostScreenState extends State<FullPostScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          title: Text(
            'Post',
          ),
        ),
        BlocConsumer<PostsBloc, PostsState>(
          listener: (context, state) {
            //обработка ошибок
          },
          builder: (context, state) {
            return (state is PostsInitial || state is PostsDownload)
                ? const SliverCircProgressIndicator()
                : const SliverNoValues(
              noValues: 'Нет постов!',
            );
          },
        )
      ],
    );
  }
}
