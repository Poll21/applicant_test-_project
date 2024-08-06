import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/service.dart';
import '../../../widgets/widgets.dart';
import '../posts.dart';
import 'widgets/post_card.dart';

@RoutePage()
class AllPostsScreen extends StatelessWidget {
  const AllPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
 //   final tabsRouter = AutoRouter.of(context); //получаем из контекста состояние AutoTabsRouter
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          title: Text(
            'Posts',
          ),
          bottom: PreferredSize(
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

                      print(AutoRouter.of(
                          context).routeData.name);
                      AutoRouter.of(
                          context).push(const FullPostRoute());

                      // context.read<PostsBloc>().add(
                      //     DownloadPostFullEvent(
                      //         post: state.posts[index]));
                    },
                  );
                },
              )
                  : const SliverNoValues(
                noValues: 'Нет постов!',
              );
            },
          )
      ],
    );
  }
}
