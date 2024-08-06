import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../service/service.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [PostsRoute(), ContactsRoute(), AlbumsRoute(), SettingsRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context); //получаем из контекста состояние AutoTabsRouter
        return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex, //активный индекс
              onTap: (index) => _openPage(index, tabsRouter),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.message), label: 'Posts'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.contact_mail), label: 'Contact'),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Album'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
        floatingActionButton: FloatingActionButton(onPressed: () {
        AutoRouter.of(context).navigate(const AddPostRoute());
        },),);
      },
    );
  }
  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
