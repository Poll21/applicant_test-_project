import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

class ContactsScreen extends StatelessWidget {
  final String title;
  const ContactsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
      ],
    );
  }
}
