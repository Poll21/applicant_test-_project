import 'package:applicant_test_project/features/posts/posts.dart';
import 'package:applicant_test_project/features/posts/view/add_post_screen.dart';
import 'package:auto_route/auto_route.dart';

import '../../features/albums/albums.dart';
import '../../features/contacts/contacts.dart';
import '../../features/home_screen/home_screen.dart';
import '../../features/login/login_screen.dart';
import '../../features/settings/settings.dart';


part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes =>
      [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          //добавляем дочерние маршруты
          children: [
          RedirectRoute(path: '', redirectTo: 'posts'),
        AutoRoute(page: PostsRoute.page, path: 'posts',
             children: [
               RedirectRoute(path: '', redirectTo: 'all_posts'),
               AutoRoute(page: AllPostsRoute.page, path: 'all_posts'),
               AutoRoute(page: FullPostRoute.page, path: 'full_post'),
               AutoRoute(page: AddPostRoute.page, path: 'add_post')
              ]
        ),
        AutoRoute(page: ContactsRoute.page, path: 'contacts'),
        AutoRoute(page: AlbumsRoute.page, path: 'albums'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
      ])];
}
