import 'package:flutter/material.dart';

import '../widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: _theme.primaryColor,
            title: Text(
              widget.title,
              style: _theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(64),
                child: SearchWidget()
            ),
          )
        ],
      ),
    );
  }
}